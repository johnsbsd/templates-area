#!/bin/sh
#
# Copyright (c) 2011 @DISTRO@
#
# See COPYING for licence terms.
#
# $@DISTRO@$
# $Id: img.sh,v 1.6 monday 12/26/11 Eric Exp $

set -e -u

if [ -z "${LOGFILE:-}" ]; then
    echo "This script can't run standalone."
    echo "Please use launch.sh to execute it."
    exit 1
fi

# UFS label

@DISTRO_MAJOR@_LABEL=${@DISTRO_MAJOR@_LABEL:-"@DISTRO@"} 

PATH=/bin:/usr/bin:/sbin:/usr/sbin
export PATH

echo "/dev/ufs/${@DISTRO_MAJOR@_LABEL} / ufs ro,noatime 1 1" > ${CLONEDIR}/etc/fstab
echo "proc /proc procfs rw 0 0" >> ${CLONEDIR}/etc/fstab 
echo "linproc /compat/linux/proc linprocfs rw 0 0" >> ${CLONEDIR}/etc/fstab
cd ${CLONEDIR} && tar -cpzf ${CLONEDIR}/dist/etc.tgz etc

makefs -B little -o label=${@DISTRO_MAJOR@_LABEL} ${IMGPATH} ${CLONEDIR}
if [ $? -ne 0 ]; then
  echo "makefs failed"
  exit 1
fi

unit=`mdconfig -a -t vnode -f ${IMGPATH}`
if [ $? -ne 0 ]; then
  echo "mdconfig failed"
  exit 1
fi

gpart create -s BSD ${unit}
gpart bootcode -b ${CLONEDIR}/boot/boot ${unit}
gpart add -t freebsd-ufs ${unit}
mdconfig -d -u ${unit}

# Make mdsums and sha256 for iso
cd /usr/obj
md5 `echo ${IMGPATH}|cut -d / -f4` >> /usr/obj/MD5SUM
sha256 `echo ${IMGPATH}| cut -d / -f4` >> /usr/obj/SHA256SUM
cd -

ls -lh ${IMGPATH}
