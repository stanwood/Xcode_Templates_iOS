
if [ "${CONFIGURATION}" != "Release" ]; then
IFS=$'\n'
git checkout -- `find "${SRCROOT}/${PROJECT_NAME}" -name AppIcon.appiconset -type d`
fi
