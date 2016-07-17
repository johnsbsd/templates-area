#!/bin/sh
set -e



if [ -f ./rules ] ; then
    echo "please remove/delete ./rules  before proceed"
    exit 1
fi

### DISTRO BUILD ###
#===============
#
for i in $(find  sources/@DISTRO_SAFE@-build -type f ) ; do
sed -i '' -e "s/ghostbsd/\@DISTRO_SAFE\@/g" \
    -e "s/GhostBSD/\@DISTRO\@/g" \
    -e "s/GHOSTBSD/\@DISTRO_MAJOR\@/g" \
  $i
done

#=================

touch rules

exit 0
