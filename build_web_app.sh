#!/bin/bash

./build_and_inject_web_plugin_static.sh

flutter build web --web-renderer html --pwa-strategy none