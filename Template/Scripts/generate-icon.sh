#!/bin/sh
export PATH=/opt/local/bin/:/opt/local/sbin:$PATH:/usr/local/bin:



# Checking for imagemagick & ghostscript
convertPath=`which convert`
gsPath=`which gs`

if [[ ! -f ${convertPath} || -z ${convertPath} ]]; then
convertValidation=true;
else
convertValidation=false;
fi

if [[ ! -f ${gsPath} || -z ${gsPath} ]]; then
gsValidation=true;
else
gsValidation=false;
fi

brew rm imagemagick
echo "Checking if imagemagick installed"
if [[ "$convertValidation" = true ]]; then
  echo "brew install imagemagick"
  brew install imagemagick
else
  echo "imagemagick is installed, upgrading if needed"
  brew install imagemagick
fi

brew rm ghostscript
echo "Checking if ghostscriptis installed"
if [[ "$gsValidation" = true ]]; then
  echo "brew install ghostscript"
  brew install ghostscript
else
  echo "ghostscript is installed, upgrading if needed"
  brew install ghostscript
fi

# Check if we are under a Git or Hg repo
if [ -d .git ] || git rev-parse --git-dir > /dev/null 2>&1; then
  commit=`git rev-parse --short HEAD`
  branch=`git rev-parse --abbrev-ref HEAD`
else
  commit=`hg identify -i`
  branch=`hg identify -b`
fi;



# No idea
shopt -s extglob
shopt -u extglob

# Caption
caption=${CONFIGURATION}
if [ "${CONFIGURATION}" = "Debug" ]; then
  caption="DEV"
else
  caption="STAGE"
fi


# Color
color='rgb(223,90,86)' #DF5A56
if [ "${CONFIGURATION}" = "Stage" ]; then
color='rgb(49,173,35)'
fi

# No idea
# function abspath() { pushd . > /dev/null; if [ -d "$1" ]; then cd "$1"; dirs -l +0; else cd "`dirname \"$1\"`"; cur_dir=`dirs -l +0`; if [ "$cur_dir" == "/" ]; then echo "$cur_dir`basename \"$1\"`"; else echo "$cur_dir/`basename \"$1\"`"; fi; fi; popd > /dev/null; }



# Icon modification
function processIcon() {
  base_path=$1

  echo "Base path:"
  echo "$base_path"

  #this is the change
  target_path=$base_path


  width=`identify -format %w "${base_path}"`
  height=`identify -format %h "${base_path}"`

  band_height=$((($height * 20) / 100))
  band_position=$(($height - $band_height))
  text_position=$(($band_position - 3))
  point_size=$(((19 * $width) / 100))

  echo "Image dimensions ($width x $height) - band height $band_height @ $band_position - point size $point_size"

  #
  # blur band and text
  #
  convert "${base_path}" -blur 0x0 /tmp/blurred.png
  convert /tmp/blurred.png -gamma 0 -fill white -draw "rectangle 0,$band_position,$width,$height" /tmp/mask.png
  convert -size ${width}x${band_height} xc:none -fill ${color} -draw "rectangle 0,0,$width,$band_height" /tmp/labels-base.png
  convert -background none -size ${width}x${band_height-100} -pointsize $point_size -fill white -stroke white -strokewidth 0.2 -border 0x3 -bordercolor transparent -gravity center caption:"$caption" /tmp/labels.png

  convert "${base_path}" /tmp/blurred.png /tmp/mask.png -composite /tmp/temp.png

  rm /tmp/blurred.png
  rm /tmp/mask.png

  #
  # compose final image
  #
  filename=New${base_file}
  convert /tmp/temp.png /tmp/labels-base.png -geometry +0+$band_position -composite /tmp/labels.png -geometry +0+$text_position -geometry +${w}-${h} -composite "${target_path}"

  # clean up
  rm /tmp/temp.png
  rm /tmp/labels-base.png
  rm /tmp/labels.png

  echo "Overlayed ${target_path}"
}

escapedPath = mod=${1//[ ]/"\ "}


if [ $CONFIGURATION = "Release" ]; then
  cp  $SRCROOT/$1/AppIcon.appiconset/icons/*.png "${SRCROOT}/${1}/AppIcon.appiconset/"
  echo "Exit"
  exit 0
fi


if [ -d "${SRCROOT}/Supporting\ Files/Images.xcassets/AppIcon.appiconset/icons/" ]; then
  echo "Directory exists."
  # get original icon to copy to assets
  cp  $SRCROOT/$1/AppIcon.appiconset/icons/*.png "${SRCROOT}/${1}/AppIcon.appiconset/"
else
  # copy orgin to AppIcon
  rsync -rv  --include '*.png' --exclude '*' "${SRCROOT}/${1}/AppIcon.appiconset/" "${SRCROOT}/${1}/AppIcon.appiconset/icons/"
fi


for entry in "${SRCROOT}/${1}/AppIcon.appiconset"/*.png
do
    processIcon "$entry"
done
