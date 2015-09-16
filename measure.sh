#!/bin/sh

PLUGINS_DIR=~/Library/Containers/com.bohemiancoding.sketch3.beta/Data/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins
if [ ! -d "${PLUGINS_DIR}" ]
  then
    PLUGINS_DIR=~/Library/Application\ Support/com.bohemiancoding.sketch3/Plugins
fi

PLUGIN_NAME="utom/sketch-measure"

echo "===================================================="
echo "开始安装 ${PLUGIN_NAME}"
echo "===================================================="

plugin_full_url="https://codeload.github.com/${PLUGIN_NAME}/zip/master"

curl -o temp.zip $plugin_full_url
unzip -o temp.zip -d "${PLUGINS_DIR}" &> /dev/null
plugin_repo_name=${PLUGIN_NAME#*/}

if  [ -d "${PLUGINS_DIR}/${plugin_repo_name}" ]
  then
    rm -rf "${PLUGINS_DIR}/${plugin_repo_name}"
fi
mv "${PLUGINS_DIR}/${plugin_repo_name}-master" "${PLUGINS_DIR}/${plugin_repo_name}"
rm temp.zip

echo "===================================================="
echo "${PLUGIN_NAME} 安装完成 😚  😚  😘  😘"
echo "===================================================="