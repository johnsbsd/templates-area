#!/usr/bin/make -f

include ../../VERSION
THEME= $(NAME)
SIZES= 640x480 800x600 1024x600 1024x768 1152x864 1280x720 1280x800 1280x1024 \
       1366x768 1440x900 1440x1050 1600x1200 1680x1050 1920x1080 1920x1200

all: background $(SIZES) 400x250
	mkdir -p $(THEME)
	cp metadata.desktop $(THEME)/

background:
	ln -sf ../svg/background.jpg

400x250:
	mkdir -p $(THEME)/contents/
	$(RM) $(THEME)/contents/screenshot.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="$(THEME)/contents/screenshot.png" 1920x1200.svg
	convert -quality 90 "$(THEME)/contents/screenshot.png" "$(THEME)/contents/screenshot.jpg"
	rm "$(THEME)/contents/screenshot.png"

$(SIZES):
	ln -sf ../svg/wall-$@.svg $@.svg
	mkdir -p $(THEME)/contents/images/
	$(RM) $(THEME)/contents/images/$@.png
	inkscape --without-gui --export-width=$(firstword $(subst x, ,$@ )) \
	    --export-height=$(lastword $(subst x, ,$@ )) \
	    --export-png="$(THEME)/contents/images/$@.png" $@.svg
	convert -quality 90 "$(THEME)/contents/images/$@.png" "$(THEME)/contents/images/$@.jpg"
	rm "$(THEME)/contents/images/$@.png"

clean:
	$(RM) -r $(THEME)/
	$(RM) *.svg
	$(RM) background.jpg
