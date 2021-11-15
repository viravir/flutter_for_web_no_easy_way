#!/bin/bash

cd plugins/native_video_player/native_video_player_web/web/native_video_player_plugin
npm i && npm run build:prod

cp dist/nativeVideoPlayerPlugin\.*.js ../../../../../web/

cd ../../../../../web

script_local_path=$(find . -type f -name 'nativeVideoPlayerPlugin\.*.js')

sed -i '' 's|<PLUGIN_SCRIPT_PATH_PLACEHOLDER>|'$script_local_path'|g' index.html
