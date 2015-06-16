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

 # renames dirs and files under common settings
 mv -f $(find ./sources/ -type d -name common-installed-settings-@CODENAME_SAFE@) $(find ./sources/ -type d -name common-installed-settings-@CODENAME_SAFE@| sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g")
 mv -f $(find ./sources/ -type d -name common-live-settings-@CODENAME_SAFE@) $(find ./sources/ -type d -name common-live-settings-@CODENAME_SAFE@| sed -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g")
 mv -f $(find ./sources/common/installed -type d -name @DISTRO_SAFE@) $(find ./sources/common/installed -type d -name @DISTRO_SAFE@| sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/common/live -type d -name @DISTRO_SAFE@) $(find ./sources/common/live -type d -name @DISTRO_SAFE@| sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

# renames files and dirs uder mate settings
 mv -f $(find ./sources/mate -type d -name @DISTRO_SAFE@) $(find ./sources/mate -type d -name @DISTRO_SAFE@ | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/mate -type f -name @DISTRO_SAFE@.xml) $(find ./sources/mate -type f -name @DISTRO_SAFE@.xml | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
mv -f $(find ./sources/mate/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-mate-installed-policy.pkla) $(find ./sources/mate/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-mate-installed-policy.pkla | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

# renames files and dirs under gnome settings
 mv -f $(find ./sources/gnome -type d -name @DISTRO_SAFE@) $(find ./sources/gnome -type d -name @DISTRO_SAFE@ | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/gnome -type f -name @DISTRO_SAFE@.xml) $(find ./sources/gnome -type f -name @DISTRO_SAFE@.xml | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/gnome/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-gnome-installed-policy.pkla) $(find ./sources/gnome/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-gnome-installed-policy.pkla | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

# renames files and dirs under cinnamon settings
 mv -f $(find ./sources/cinnamon -type d -name @DISTRO_SAFE@) $(find ./sources/cinnamon -type d -name @DISTRO_SAFE@ | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/cinnamon -type f -name @DISTRO_SAFE@.xml) $(find ./sources/cinnamon -type f -name @DISTRO_SAFE@.xml | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
 mv -f $(find ./sources/cinnamon/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-cinnamon-installed-policy.pkla) $(find ./sources/cinnamon/installed/${DISTRO_SAFE}/etc -type f -name 10-@DISTRO_SAFE@-cinnamon-installed-policy.pkla | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

# renames dirs under grub2
 mv -f $(find ./sources/grub2 -type d -name @DISTRO_SAFE@) $(find ./sources/grub2 -type d -name @DISTRO_SAFE@| sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")

### PORTS ####
#================
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

# ports/gnome
for i in $(ls ports/gnome/installed/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@GHOSTBSD_USER\@/${GHOSTBSD_USER}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/gnome/installed/$i \
    > ports/gnome/installed/$i
done

for i in $(ls ports/gnome/live/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/gnome/live/$i \
    > ports/gnome/live/$i
done

# ports/cinnamon
for i in $(ls ports/cinnamon/installed/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@GHOSTBSD_USER\@/${GHOSTBSD_USER}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/cinnamon/installed/$i \
    > ports/cinnamon/installed/$i
done

for i in $(ls ports/cinnamon/live/) ; do
sed -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/cinnamon/live/$i \
    > ports/cinnamon/live/$i
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

# ports grub2
for i in $(ls ports/grub2/) ; do
sed     -e "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    -e "s/\@PORT_VERSION\@/${PORT_VERSION}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    ../../templates/ports/grub2/$i \
    > ports/grub2/$i
done


### MATE ####
#================
# sources/mate/installed/schemas

for i in $(ls sources/mate/installed/schemas) ; do
sed -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_THEME\@/${GTK_THEME}/g" \
    -e "s/\@MATE_ICONSET\@/${MATE_ICONSET}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    ../../templates/sources/mate/installed/schemas/$i \
    > sources/mate/installed/schemas/$i
done

# sources/mate/installed/etc/default/grub

sed -i "" "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    sources/mate/installed/${DISTRO_SAFE}/etc/default/grub

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
    sources/mate/installed/${DISTRO_SAFE}/etc/default/grub 

sed -i "" "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    sources/mate/installed/${DISTRO_SAFE}/etc/default/grub 

### GNOME ####
#================
# sources/gnome/installed/schemas

for i in $(ls sources/gnome/installed/schemas) ; do
sed -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_THEME\@/${GTK_THEME}/g" \
    -e "s/\@MATE_ICONSET\@/${MATE_ICONSET}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    ../../templates/sources/gnome/installed/schemas/$i \
    > sources/gnome/installed/schemas/$i
done

# sources/gnome/installed/etc/default/grub

sed -i "" "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    sources/gnome/installed/${DISTRO_SAFE}/etc/default/grub

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
    sources/gnome/installed/${DISTRO_SAFE}/etc/default/grub 

sed -i "" "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    sources/gnome/installed/${DISTRO_SAFE}/etc/default/grub 

### CINNAMON ####
#================
# sources/cinnamon/installed/schemas

for i in $(ls sources/cinnamon/installed/schemas) ; do
sed -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_THEME\@/${GTK_THEME}/g" \
    -e "s/\@MATE_ICONSET\@/${MATE_ICONSET}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    ../../templates/sources/cinnamon/installed/schemas/$i \
    > sources/cinnamon/installed/schemas/$i
done

# sources/cinnamon/installed/etc/default/grub

sed -i "" "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    sources/cinnamon/installed/${DISTRO_SAFE}/etc/default/grub

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
    sources/cinnamon/installed/${DISTRO_SAFE}/etc/default/grub 

sed -i "" "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    sources/cinnamon/installed/${DISTRO_SAFE}/etc/default/grub 

# sources/cinnamon/installed/etc/skel/cinnamon/configs/menu@cinnamon.org/menu@cinnamon.org.json

sed -i "" "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    sources/cinnamon/installed/${DISTRO_SAFE}/etc/skel/cinnamon/configs/menu@cinnamon.org/menu@cinnamon.org.json


### GRUB2 ###
#====================
# sources grub2
for i in boot/grub/grub.cfg ; do
    sed -e "s/\@DISTRO\@/${DISTRO}/g" \
        -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    ../../templates/sources/grub2/$i \
    > sources/grub2/$i
done

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
sources/grub2/boot/grub/themes/${DISTRO_SAFE}/theme.txt

### XFCE ###
#==========
# sources/xfce/installed/etc/default/grub
sed -i "" "s/\@CODENAME_SAFE\@/${CODENAME_SAFE}/g" \
    sources/xfce/installed/etc/default/grub

sed -i "" "s/\@DISTRO\@/${DISTRO}/g" \
    sources/xfce/installed/etc/default/grub 

sed -i "" "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    sources/xfce/installed/etc/default/grub 


# sources /xfce/installed/etc/xdg/xfce4/xfconf/
for i in xfce4-desktop.xml xfce4-panel.xml xsettings.xml  ; do
sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@WALLPAPER\@/${WALLPAPER}/g" \
    -e "s/\@GTK_THEME\@/${GTK_THEME}/g" \
    -e "s/\@XFCE_ICONSET\@/${XFCE_ICONSET}/g" \
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
#=================

if [ "${CODENAME_SAFE}" == "null" ]; then

# ports
for i in $(find ports -type f -name pkg-install ) ; do
    sed  -i "" "s/-null//g"  $i
done

for i in $(find ports -type f -name pkg-deinstall ) ; do
    sed  -i "" "s/-null//g"  $i
done

for i in $(find ports -type f -name pkg-plist ) ; do
    sed  -i "" "s/-null//g"  $i
done

    for i in $(find ports -type f -name Makefile )\
        $(find ports -type f -name distinfo ) ; do
        sed  -i "" "s/-null//g"  $i
    done

    workdir=$(pwd)
    for i in $(find ports -type d -depth 2) ; do
        cd $i && make makesum
        cd $workdir
    done
fi


touch rules

exit 0
