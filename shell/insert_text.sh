#!/bin/bash

# 指定输入文件和输出文件
input_file="input.txt"
output_file="output.txt"

# 定义要插入的字符串
insert_string="=======##========"

# 递增的序号
counter=1

# 当前字符数
char_count=0

# 读取输入文件的内容
while IFS= read -r -n 1 char
do
    # 在每1500个字符后插入字符串
    if [ $char_count -ge 1500 ]; then
        echo "$insert_string" >> "$output_file"
        char_count=0
        ((counter++))
        echo "Inserted at position $((counter * 1500))"
    fi
    echo -n "$char" >> "$output_file"
    ((char_count++))
done < "$input_file"

# 插入文件末尾的剩余字符
if [ $char_count -gt 0 ]; then
    echo "$insert_string" >> "$output_file"
    echo "Inserted at position $((counter * 1500))"
fi

echo "完成，输出文件为 $output_file"
