#!/bin/bash -e

stat ${ANDROID_HOME}/temp/tools_r*.zip >> /dev/null 2>&1
if test $? -ne 0; then
    echo "No zip found in temp directory"
    exit 0
fi

NB_FILE=$(ls -1 ${ANDROID_HOME}/tools | wc -l)
if test ${NB_FILE} -ne 0; then
    echo "Some files are present in tools directory"
    exit 0
fi

cd ${ANDROID_HOME}
echo "Extracting tools zip"
unzip ${ANDROID_HOME}/temp/tools_r*.zip
echo "DONE"
