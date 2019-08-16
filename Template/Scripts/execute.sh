#!/bin/sh

# This script will shortcut pulling a branch, running pod install and openning the workspace.
# To execute the command, run on the root folder:
# sh Scripts/execute.sh

echo "Running pod install"
pod install

echo "Openning project..."
open *.xcworkspace
