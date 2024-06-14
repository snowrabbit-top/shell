#!/bin/bash

# 定义一个字符串数组
words=(
    "./text.txt"
    #"/opt/Jetbrains/Clion/bin/clion64.vmoptions"
    #"/opt/Jetbrains/Clion/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/DataGrip/bin/datagrip64.vmoptions"
    #"/opt/Jetbrains/GoLand/bin/goland64.vmoptions"
    #"/opt/Jetbrains/GoLand/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/Idea/bin/idea64.vmoptions"
    #"/opt/Jetbrains/Idea/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/PhpStorm/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/PhpStorm/bin/phpstorm64.vmoptions"
    #"/opt/Jetbrains/PyCharm/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/PyCharm/bin/pycharm64.vmoptions"
    #"/opt/Jetbrains/Rider/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/Rider/bin/rider64.vmoptions"
    #"/opt/Jetbrains/RustRover/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/RustRover/bin/rustrover64.vmoptions"
    #"/opt/Jetbrains/WebStorm/bin/jetbrains_client64.vmoptions"
    #"/opt/Jetbrains/WebStorm/bin/webstorm64.vmoptions"
)

# 使用for循环遍历数组
for word in "${words[@]}"; do
    echo "$word"
    # 使用cat命令将文本内容追加到文件中
    cat >>"$word" <<EOF

-javaagent:/opt/Jetbrains/jetbra/ja-netfilter.jar=jetbrains
--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED
EOF
done
