#!/bin/bash

# 获取 free 命令的输出，这里我们使用 -h 参数让输出更易读
free_output=$(free -m)

# 提取已使用的内存量，根据您提供的输出格式，已使用的内存量位于第三列
# 我们使用 awk 命令并指定字段分割符为空白字符，以适应可能存在的空格
used_mem=$(echo "$free_output" | awk 'NR==2 {print $3}')
# 总内存量
total_mem=$(echo "$free_output" | awk 'NR==2 {print $2}')
# 当前可用内存量
available_mem=$(echo "$free_output" | awk 'NR==2 {print $7}')

# 检查是否成功提取到数字
if ! [[ "$used_mem" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    # shellcheck disable=SC2028
    echo "已使用内存量不是数字,请查看:\r\n"
    echo "$free_output"
    exit 1
fi
# 检查是否成功提取到数字
if ! [[ "$total_mem" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    # shellcheck disable=SC2028
    echo "总内存量不是数字,请查看:\r\n"
    echo "$free_output"
    exit 1
fi
# 检查是否成功提取到数字
if ! [[ "$available_mem" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    # shellcheck disable=SC2028
    echo "总内存量不是数字,请查看:\r\n"
    echo "$free_output"
    exit 1
fi

# 输出当前已使用的内存量
echo "已用的内存: $used_mem MB."
# 输出总内存量
echo "总内存: $total_mem MB."
# 输当前可用内存量
echo "可用内存: $available_mem MB."

# 设定一个比较的内存值，单位为MB
compare_value=20480

# 使用算术比较判断当前已使用内存量是否大于设定的比较值
if [ "$used_mem" -gt "$compare_value" ]; then
    echo "已用内存大于 $compare_value MB."
else
    echo "已用内存小于或等于 $compare_value MB."
fi
# 循环执行任务
for i in {1..5}; do
    echo "Welcome $i times"
done

echo "暂停 0.5 秒,以便任务全部执行起来"
# 暂停 0.5 秒,以便任务全部执行起来
sleep 0.5

# 获取 free 命令的输出，这里我们使用 -h 参数让输出更易读
free_output=$(free -m)

# 提取已使用的内存量，根据您提供的输出格式，已使用的内存量位于第三列
# 我们使用 awk 命令并指定字段分割符为空白字符，以适应可能存在的空格
current_mem=$(echo "$free_output" | awk 'NR==2 {print $3}')

echo "当前占用内存: $current_mem MB."

# 计算当前步进次任务所占内存量
# shellcheck disable=SC2003
step_used_mem=$(expr "$current_mem" - "$used_mem")
echo "当前步进次任务所占内存量: $step_used_mem MB."

# 使用算术比较判断当前步进次任务所占内存量是否大于零
if [ "$step_used_mem" -gt 0 ]; then
    echo "当前步进次任务所占内存量大于 0 MB."
else
    echo "当前步进次任务所占内存量小于或等于 0 MB."
fi
