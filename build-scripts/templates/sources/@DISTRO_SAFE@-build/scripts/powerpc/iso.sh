#!/bin/sh
#
# Copyright (c) 2005 Dario Freni
#
# See COPYING for licence terms.
#
# $FreeBSD$
# $Id: iso.sh,v 1.5 2006/10/01 12:00:47 drizzt Exp $

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

@DISTRO_MAJOR@_LABEL=${@DISTRO_MAJOR@_LABEL:-"@DISTRO@"}

echo "#### Building bootable ISO image for ${ARCH} ####"

# This part was taken from the mkisoimages.sh scripts under
# /usr/src/release/${ARCH}/
type mkisofs 2>&1 | grep " is " >/dev/null
if [ $? -ne 0 ]; then
    echo The cdrtools port is not installed.  Trying to get it now.
    if [ -f /usr/ports/sysutils/cdrtools/Makefile ]; then
	cd /usr/ports/sysutils/cdrtools && ARCH="$(uname -p)" make install BATCH=yes && make clean
    else
	if ! pkg_add -r cdrtools; then
	    echo "Could not get it via pkg_add - please go install this"
	    echo "from the ports collection and run this script again."
	    exit 2
	fi
    fi
fi


echo "Saving mtree structure..."
mtree -Pcp ${CLONEDIR} | bzip2 -9 > root.dist.bz2
mkdir -p ${CLONEDIR}/dist
mv root.dist.bz2 ${CLONEDIR}/dist/

echo "/dev/iso9660/${@DISTRO_MAJOR@_LABEL} / cd9660 rw 0 0" > ${CLONEDIR}/etc/fstab

cd ${CLONEDIR}
cp ${SRCDIR}/release/powerpc/boot.tbxi boot

echo "Running mkisofs..."

mkisofs -hfs-bless boot -map ${SRCDIR}/release/powerpc/hfs.map -r -hfs -part -no-desktop -hfs-volid ${@DISTRO_MAJOR@_LABEL} -V ${@DISTRO_MAJOR@_LABEL} -l -J -L -o $ISOPATH . >> ${LOGFILE} 2>&1

echo "ISO created:"

ls -lh ${ISOPATH}

cd ${LOCALDIR}
