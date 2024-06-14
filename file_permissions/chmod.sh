#!/bin/bash

# 获取当前目录
cur_dir=$(cd "$(dirname "$0")" || exit; pwd)
# shellcheck disable=SC2160
while [ true ]; do
  sudo chmod 777 -R "$cur_dir"
  sleep 10
done