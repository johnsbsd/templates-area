#!/bin/sh


if [ -f VERSION ]; then
    . ./VERSION
else
    echo "No VERSION-File, exit!"
    exit 1
fi

#cat VERSION

if [ -f ./rules ] ; then
    echo "please remove/delete ./rules  before proceed"
    exit 1
fi


# some cleanup
rm -Rf ./share/

# copy from templates
cd ./src


for image in $(ls *.jpg | cut -d . -f1 ) ; do
    
    mkdir -p ../share/wallpapers/${image}/contents/images
    sed -e "s/\@IMAGE_NAME\@/${image}/g" metadata.desktop \
    > ../share/wallpapers/${image}/metadata.desktop
    
    # convert each image to png in 400x250 resolution
    convert ${image}.jpg -resize 400x250\! ../share/wallpapers/${image}/contents/screenshot.png
    
    # convert each image to jpg in $SIZES resolution

    for imgsize in ${SIZE} ; do
        convert ${image}.jpg -resize ${imgsize}\! ../share/wallpapers/${image}/contents/images/${imgsize}.jpg
    done
done

# copy default wallpaper to /usr/share/wallpapers
cp ../share/wallpapers/${DEFAULT_WALLPAPER}/contents/images/1600x1200.jpg ../share/wallpapers/default_wallpaper.jpg

cd ..
touch rules

exit 0
