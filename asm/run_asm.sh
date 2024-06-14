#!/bin/bash

#!/bin/bash

# 使用find命令查找所有.asm文件，并将结果保存到变量files中
files=$(find . -type f -name "*.asm")

# 遍历变量files中的每个文件，并打印出来
for file in $files; do
    echo "编译文件 $file 中"
    nasm -f elf64 "$file" -o "${file%.asm}".o
    # shellcheck disable=SC2181
    if [ $? -eq 0 ]; then
        echo "编译成功"
    else
        echo "编译失败"
    fi
    if [ -f "${file%.asm}".o ]; then
        echo "链接文件 ${file%.asm}.o 中"
        ld -o "${file%.asm}" "${file%.asm}".o
        # shellcheck disable=SC2181
        if [ $? -eq 0 ]; then
            echo "链接成功"
        else
            echo "链接失败"
        fi
    else
        echo "没有找到 ${file%.asm}.o 文件"
    fi
    if [ -f "${file%.asm}" ]; then
        echo "运行文件 ${file%.asm} 中: "
        echo "请输入任意键继续..."
        read -n 1 -s -r -p ""
        echo "运行结果如下:"
        echo "-------------------------------------"
        ./"${file%.asm}"
        echo "-------------------------------------"
        exit 0
    else
        echo "没有找到 ${file%.asm} 文件"
    fi
done