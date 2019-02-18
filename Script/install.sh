#!/usr/bin/env bash

# Clone xcode templates
echo "Cloning Xcode Template"
git clone git@github.com:stanwood/Xcode_Templates_iOS.git /tmp/xcode_template

echo "Removing existing Template folder"
sudo rm -rf /Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates/Source/Module.xctemplate

echo "Installing..."
sudo mv /tmp/xcode_template/Module/Module.xctemplate "/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File Templates/Source/"

echo "Finishing installation"
rm -rf /tmp/xcode_template
