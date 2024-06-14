#!/bin/bash

current_dir=$(pwd)

echo "当前目录: $current_dir"

sudo rm -rf /usr/local/bin/clion

sudo rm -rf /usr/local/bin/datagrip

sudo rm -rf /usr/local/bin/goland

sudo rm -rf /usr/local/bin/idea

sudo rm -rf /usr/local/bin/rider

sudo rm -rf /usr/local/bin/phpstorm

sudo rm -rf /usr/local/bin/pycharm

sudo rm -rf /usr/local/bin/webstorm

sudo rm -rf /usr/local/bin/rustrover

sudo ln -s /opt/Jetbrains/Clion/bin/clion.sh /usr/local/bin/clion

sudo ln -s /opt/Jetbrains/DataGrip/bin/datagrip.sh /usr/local/bin/datagrip

sudo ln -s /opt/Jetbrains/GoLand/bin/goland.sh /usr/local/bin/goland

sudo ln -s /opt/Jetbrains/Idea/bin/idea.sh /usr/local/bin/idea

sudo ln -s /opt/Jetbrains/Rider/bin/rider.sh /usr/local/bin/rider

sudo ln -s /opt/Jetbrains/PhpStorm/bin/phpstorm.sh /usr/local/bin/phpstorm

sudo ln -s /opt/Jetbrains/PyCharm/bin/pycharm.sh /usr/local/bin/pycharm

sudo ln -s /opt/Jetbrains/WebStorm/bin/webstorm.sh /usr/local/bin/webstorm

sudo ln -s /opt/Jetbrains/RustRover/bin/rustrover.sh /usr/local/bin/rustrover
