#!/bin/sh
#
# Copyright (c) 2011 @DISTRO@
#
# See COPYING for licence terms.
#
# $@DISTRO@$
# $Id: iso.sh,v 1.7 Thu Dec 15 18:08:31 AST 2011 Eric

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

@DISTRO_MAJOR@_LABEL=${@DISTRO_MAJOR@_LABEL:-"@DISTRO@"}

echo "#### Building bootable ISO image for ${ARCH} ####"
# Creates etc/fstab to avoid messages about missing it
if [ ! -e ${BASEDIR}/etc/fstab ] ; then
    touch ${BASEDIR}/etc/fstab
fi

cd ${BASEDIR} && tar -cpzf ${BASEDIR}/dist/etc.tgz etc

make_standard_iso()
{
echo "### Running makefs to create ISO ###"
bootable="-o bootimage=i386;${BASEDIR}/boot/cdboot -o no-emul-boot"
makefs -t cd9660 $bootable -o rockridge -o label=${@DISTRO_MAJOR@_LABEL} ${ISOPATH} ${BASEDIR}
}

make_grub_iso()
{
# Reference for hybrid DVD/USB image
# Use GRUB to create the hybrid DVD/USB image
echo "Creating ISO..."
grub-mkrescue -o ${ISOPATH} ${BASEDIR} -- -volid ${@DISTRO_MAJOR@_LABEL}
if [ $? -ne 0 ] ; then
	echo "Failed running grub-mkrescue"
	exit 1
fi
}

echo "### ISO created ###"

# Make md5 and sha256 for iso
make_checksums()
{
cd /usr/obj/${ARCH}/${PACK_PROFILE}
md5 `echo ${ISOPATH}|cut -d / -f6`  >> /usr/obj/${ARCH}/${PACK_PROFILE}/$(echo ${ISOPATH}|cut -d / -f6).md5
sha256 `echo ${ISOPATH}| cut -d / -f6` >> /usr/obj/${ARCH}/${PACK_PROFILE}/$(echo ${ISOPATH}|cut -d / -f6).sha256
cd -
}

make_grub_iso
make_checksums

set -e
cd ${LOCALDIR}
