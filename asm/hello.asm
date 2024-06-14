; .text 部分是程序的代码段，global _start 指令告诉链接器程序的入口点是 _start 标签。
section .text
    global _start                     ; 必须为链接器（ld）声明

; _start 标签定义了程序的起始点。
_start:                               ; 告诉链接器入口点
    ; 将 len（消息长度）的值移动到 edx 寄存器。edx 通常用于存储输入/输出操作的长度。
    mov edx,len                       ; 消息长度
    ; 将 len（消息长度）的值移动到 edx 寄存器。edx 通常用于存储输入/输出操作的长度。
    mov ecx,msg                       ; 要写入的消息
    ; 将数字 1 移动到 ebx 寄存器。在Linux中，1 是标准输出的文件描述符。
    mov ebx,1                         ; 文件描述符（stdout）
    ; 将数字 4 移动到 eax 寄存器。eax 寄存器用于指定系统调用的编号，4 代表 write 系统调用。
    mov eax,4                         ; 系统调用号（sys_write）
    ; 触发中断 0x80 来执行系统调用。这是32位x86架构中进行系统调用的标准方法。
    int 0x80                          ; 调用内核

    ; 在打印完消息后，将数字 1 移动到 eax 寄存器，准备执行退出系统调用。
    mov eax,1                         ; 系统调用号（sys_exit）
    ; 再次触发中断 0x80 来执行退出系统调用，结束程序。
    int 0x80                          ; 调用内核

; .data 部分是程序的数据段，msg 定义了要打印的字符串，len 计算了字符串的长度（从 msg 开始到当前位置的距离）。
section .data
msg db '汇编语言，Hello, World!', 0xa    ; 要打印的字符串
len equ $ - msg                        ; 字符串的长度
