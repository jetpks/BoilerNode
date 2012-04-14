#!/bin/bash
PUBLICTARGET="../public"
OFFLINE="${PUBLICTARGET}/offline-assets"


echo -n "Killing off old cruft..."
rm -rf ${PUBLICTARGET}/*
echo " done"

echo -n "Copying in static files..."
cp -R static/ ${OFFLINE}/
echo " done"

echo -n "Compiling JavaScript to CommonJS..."
pakmanager build > /dev/null 2>&1
echo " done"

echo -n "Compiling Jade to HTML..."
jade *.jade > /dev/null
echo " done"

echo -n "Compiling LESS to CSS and minifying..."
lessc style.less | cleancss -o style.css
echo " done"

echo -n "Moving packaged files..."
mv *.css ${OFFLINE}/
mv index.html ${PUBLICTARGET}/
mv *.html ${OFFLINE}/
mv pakmanaged.js ${OFFLINE}/main.js
#cp -R ./public/ ./windows/
echo " done"

echo -n "Writing cache manifest..."

cat > ${PUBLICTARGET}/main.appcache <<HEREDOCEND
CACHE MANIFEST
## This is the cache manifest.
# EVERYTHING that you use in your HTML5 application *MUST* be listed in this.

## version `date +%s`

CACHE:
## Pages:
# a list of your pages go here:
# e.g.:
# /offline-assets/page.html
/offline-assets/offline.html

## JS Resources:
# a list of your js resources go here:
/offline-assets/main.js

## CSS:
# a list of your css resources go here:
/offline-assets/style.css

## Images:
# a list of your images go here:
# e.g.:
# /offline-assets/images/logo.png

## Fonts:
# it's a good idea to load your font files from the filesystem, instead of 
# over the internet. This is because you want your app to work offline.
# e.g.:
# /offline-assets/fonts/opensans-bold.ttf

## The file that you want to load when something is missing:
FALLBACK:
/offline-assets/offline.html

## Any network resoures that your app requests via JS:
NETWORK:
HEREDOCEND

echo " done"
