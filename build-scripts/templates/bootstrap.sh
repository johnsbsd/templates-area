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
rm -Rf ./sources/*

# copy from templates
 cp -af ../../templates/sources/ ./sources

### DISTRO BUILD ###
#===============
#
for i in $(find  sources/@DISTRO_SAFE@-build -type f ) ; do
sed -i '' -e "s/\@DISTRO\@/${DISTRO}/g" \
    -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g" \
    -e "s/\@DISTRO_USER\@/${DISTRO_USER}/g" \
    -e "s/\@DISTRO_MAJOR\@/${DISTRO_MAJOR}/g" \
    -e "s/\@ORGANIZATION\@/${ORGANIZATION}/g" \
    -e "s/Eric /Ovidiu /g" \
    -e "s/Turgeon/Angelescu/g" \
    -e "s/GhostBSD/zBSD/g" \
    $i
done


# renames dirs
for dirs in $(find ./sources -d 1 -type d -name @DISTRO_SAFE@-build) ; do
    mv -f ${dirs} $(find ./sources -d 1 -type d -name @DISTRO_SAFE@-build| sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
done


for dirs in $(find sources -type d -name @DISTRO_SAFE@.d) ; do
    mv -f ${dirs} $(find sources -type d -name @DISTRO_SAFE@.d | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
done

# renames files
for files in  $(find sources -type f -name @DISTRO_SAFE@\*) ; do
    mv -f $files  $(echo "$files" | sed -e "s/\@DISTRO_SAFE\@/${DISTRO_SAFE}/g")
done

#=================

touch rules

exit 0
