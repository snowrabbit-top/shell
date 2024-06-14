#!/bin/bash

# 获取当前目录
current_dir=$(pwd)
echo "当前目录: $current_dir"
name_list=("Clion" "DataGrip" "GoLand" "Idea" "PhpStorm" "PyCharm" "Rider" "RustRover" "WebStorm")
# shellcheck disable=SC2043
for name in "${name_list[@]}"; do
    echo "$name"
    # 寻找当前目录下所有名称中包含 $name（不区分大小写）的目录
    # shellcheck disable=SC2035
    dir_list=$(ls -d */)
    for dir in $dir_list; do
        echo "$dir"
        # 检查找到的目录是否不为空，并且不包含已经设置的目录名
        if [[ -d "$dir" && "$dir" != "$name" ]]; then
            # 构造新的目录名，这里我们只使用 name 变量作为新目录名
            new_dir_name="$name"
            # 重命名目录
            echo "重命名目录 '$dir' 为 '$new_dir_name'"
            mv "$dir" "$new_dir_name"
            # 检查重命名是否成功
            # shellcheck disable=SC2181
            if [[ $? -eq 0 ]]; then
                echo "目录 '$dir' 已成功重命名为 '$new_dir_name'。"
            else
                echo "重命名目录 '$dir' 失败。"
            fi
        fi
    done
done
