#!/bin/sh
set -e

if [ -f VERSION ]; then
    . ./VERSION
else
    echo "No VERSION-File, exit!"
    exit 1
fi

cat VERSION

if [ -f ./rules ] ; then
    echo "please remove/delete ./rules  before proceed"
    exit 1
fi

# some cleanup
rm -Rf ./ports/*
rm -Rf ./sources/*

# copy from templates
 cp -af ../../templates/ports/* ./ports
 cp -af ../../templates/sources/* ./sources
 mv -f $(find ./sources/ -type d -name common-installed-settings-@CODENAME_SAFE@) $(find ./sources/ -type d -name common-installed-settings-@CODENAME_SAFE@| sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g")
 mv -f $(find ./sources/ -type d -name common-live-settings-@CODENAME_SAFE@) $(find ./sources/ -type d -name common-live-settings-@CODENAME_SAFE@| sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g")
 mv -f $(find ./sources/ -type d -name @DISTRO_SAFE@) $(find ./sources/ -type d -name @DISTRO_SAFE@| sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/mate -type f -name @DISTRO_SAFE@.cfg) $(find ./sources/mate -type f -name @DISTRO_SAFE@.cfg | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/xfce -type f -name @DISTRO_SAFE@.cfg) $(find ./sources/xfce -type f -name @DISTRO_SAFE@.cfg | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

# ports/mate

for i in $(ls ports/mate/installed/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@GHOSTBSD_USER\@/${GHOSTBSD_USER}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/mate/installed/$i \
    > ports/mate/installed/$i
done

for i in $(ls ports/mate/live/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/mate/live/$i \
    > ports/mate/live/$i
done

#ports/common

for i in $(ls ports/common/installed/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/common/installed/$i \
    > ports/common/installed/$i
done

for i in $(ls ports/common/live/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@GHOSTBSD_USER\@/${GHOSTBSD_USER}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/common/live/$i \
    > ports/common/live/$i
done

# sources/mate/installed/schemas

for i in $(ls sources/mate/installed/schemas) ; do
sed -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_THEME\@/${GTK_THEME}/g" \
    -e "s/\@MATE_ICONSET\@/${MATE_ICONSET}/g" \
    ../../templates/sources/mate/installed/schemas/$i \
    > sources/mate/installed/schemas/$i
done

# sources grub2
for i in boot/grub/grub.cfg ; do
    sed -e "s/\@DISTRO\@/${DISTRO}/g" \
        -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    ../../templates/sources/grub2/$i \
    > sources/grub2/$i
done

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
sources/grub2/boot/grub/themes/${DISTRO_SAFE}/theme.txt

# ports grub2
for i in $(ls ports/grub2/) ; do
sed     -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/grub2/$i \
    > ports/grub2/$i
done

# sources/xfce/installed/etc/default/grub.d

sed -i "" "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    sources/xfce/installed/etc/default/grub.d/${DISTRO_SAFE}.cfg 

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
    sources/xfce/installed/etc/default/grub.d/${DISTRO_SAFE}.cfg 

# sources /xfce/installed/etc/xdg/xfce4/xfconf/

for i in xfce4-desktop.xml xfce4-panel.xml  ; do
sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_YHEME\@/${GTK_THEME}/g" \
    ../../templates/sources/xfce/installed/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/$i \
    > sources/xfce/installed/etc/xdg/xfce4/xfconf/xfce-perchannel-xml/$i

for i in $(ls ports/xfce/installed/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@GHOSTBSD_USER\@/${GHOSTBSD_USER}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/xfce/installed/$i \
    > ports/xfce/installed/$i
done

for i in $(ls ports/xfce/live/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/xfce/live/$i \
    > ports/xfce/live/$i
done

done

touch rules

exit 0
