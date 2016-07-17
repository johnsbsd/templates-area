#!/bin/sh
#
# Copyright (c) 2011 @DISTRO@
#
# See COPYING for license terms.
#
# finalize.sh,v 1.0 Wed 17 Jun 19:42:49 ADT 2015cd  Ovidiu Angelescu
#

set -e -u

if [ -z "${LOGFILE:-}" ]; then
  echo "This script can't run standalone."
  echo "Please use launch.sh to execute it."
  exit 1
fi

remove_desktop_entries()
{
  # Remove unneeded *.desktop
  for rfile in gmplayer spideroak ; do
    if [ -f "/usr/local/share/applications/${rfile}.desktop" ]; then
      rm ${BASEDIR}/usr/local/share/applications/gmplayer.desktop
    fi
  done
}

cursor_theme()
{
# Set cursor theme instead of default from xorg
# to do with alternatives if possible from common installed settings
  if [ -e ${BASEDIR}/usr/local/lib/X11/icons/default ] ; then
    rm ${BASEDIR}/usr/local/lib/X11/icons/default 
  fi
  cd ${BASEDIR}/usr/local/lib/X11/icons
  ln -sf $CURSOR_THEME default
  cd -
}

rm_fbsd_pcsysinstall()
{
  # Setting installer
  rm -rf ${BASEDIR}/usr/sbin/pc-sysinstall
  rm -rf ${BASEDIR}/usr/share/pc-sysinstall
}

dm_enable()
{
# enable display manager if installed
if [ -e $(which pcdm) ] ; then 
  sed -i '' 's@#pcdm_enable="NO"@gdm_enable="YES"@g' ${BASEDIR}/etc/rc.conf
fi
}

clean_desktop_files()
{
# Remove Gnome and Mate from ShowOnly in *.desktop
# needed for update-station
@DISTRO@=`ls ${BASEDIR}/usr/local/share/applications/ | grep -v libreoffice | grep -v kde4 | grep -v screensavers` 
for desktop in $@DISTRO@; do
  sed -i "" -e 's/OnlyShowIn=Gnome;//g' ${BASEDIR}/usr/local/share/applications/$desktop
  sed -i "" -e 's/OnlyShowIn=MATE;//g' ${BASEDIR}/usr/local/share/applications/$desktop
  sed -i "" -e 's/GNOME;//g' ${BASEDIR}/usr/local/share/applications/$desktop
  sed -i "" -e 's/MATE;//g' ${BASEDIR}/usr/local/share/applications/$desktop
  sed -i "" -e 's/OnlyShowIn=//g' ${BASEDIR}/usr/local/share/applications/$desktop
done
}

default_@DISTRO_SAFE@_rc_conf()
{
  cp  ${BASEDIR}/etc/rc.conf ${BASEDIR}/etc/rc.conf.@DISTRO_SAFE@
}

remove_desktop_entries
clean_desktop_files
# rm_fbsd_pcsysinstall
cursor_theme
# dm_enable
default_@DISTRO_SAFE@_rc_conf

