googleServicesFileName="GoogleService-Info.plist"
if [ "${CONFIGURATION}" = "Debug" ]; then
googleServicesFileName="GoogleService-Info-Debug.plist"
elif [ "${CONFIGURATION}" = "Stage" ]; then
googleServicesFileName="GoogleService-Info-Stage.plist"
fi

googleServicesFilePath="${PROJECT_DIR}/${PROJECT_NAME}/Supporting Files/GooglePlists/${googleServicesFileName}"

echo ""
echo "Checking if ${googleServicesFileName} plist exisits"
if [ -f $googleServicesFilePath ]; then
echo "Found ${googleServicesFileName}... 😍"
echo "uploading..."
echo ""
else
echo "🤮🤮🤮🤮 I was just trying to upload ${googleServicesFileName} to Crashlytics 🛑🛑🛑"
echo "But ${googleServicesFileName} file is not here! 🙄🧐"
echo "Where did you move it?"
echo "${googleServicesFileName} Location: $googleServicesFilePath not exists"
echo ""
exit 1
fi
echo ""

"${PODS_ROOT}/StanwoodAnalytics/Frameworks/Fabric.framework/upload-symbols" 4522f719c7ceecac5149a4bb8a130ff7ca33179c 9692003b2e8e4f0558316d230e8722210371fd1e1e6f5b2d575b8f3b475a6b6b -gsp "${googleServicesFilePath}" -p ios "${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"
