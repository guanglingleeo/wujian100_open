[TOC]

# lib/Makefile解析

原文件位于lib/Makefile，在运行时会被复制到workdir目录，并且在workdir目录想进行make。

## 1 编译工具

```
TOOL_EXTENSION	= ${TOOL_PATH}/bin/riscv64-unknown-elf-
CC    = ${TOOL_EXTENSION}gcc
AS    = ${TOOL_EXTENSION}as
LINK  = ${TOOL_EXTENSION}ld
OBJDUMP = ${TOOL_EXTENSION}objdump
OBJCOPY = ${TOOL_EXTENSION}objcopy
```

## 2 转换工具

CONVERT		=../tools/Srec2vmem.py

## 3 工具选项

```
CFLAGS        = -march=rv32emcxcki -mabi=ilp32e 
LDFLAGS       = -march=rv32emc -mabi=ilp32e
CFLAGS       += -O3 ...
LINKFLAGS     = -Tlinker.lcf -nostartfile
LINKLIBS     += $(LDFLAGS) -lc -lgcc
OBJDUMPFLAGS  = -S -Mnumeric
HEXFLAGS      = -O srec

```

## 4 生成目标all(.PHONY)

### 4.1 CC .c/.s/.S生成.o

### 4.2 CC .o 和.lcf生成.elf

### 4.3 OBJDUMP .elf生成.obj

### 4.4 OBJCOPY .elf生成.hex

### 4.5 CONVERT .hex生成.pat

## 5 生成目标clean(.PHONY)

```
rm -rf *.o *.pat *.elf *.obj *.hex
```

----

# Makefile简明教程

## 1. 基本规则

```
target: prerequisites
    command 
```

- target 目标,可以是文件，也可以是.PHONY
- prerequisites 完成该目标需要的依赖，可以是文件或者其他目标
- command 从依赖到目标需要执行的`shell`命令，默认shell是Bash

注意：

- target之前不能有空格
- command之前必须使用TAB键(不能是空格)

## 2. 其他语法

所有其他语法都是为了基本规则做准备

- #是注释
- include包含其他makefile
- ifeq做条件编译选项
- 变量定义、引用()或者{}

```
srcs  =       # 赋值，全局Makefile展开之后的赋值
srcs :=       # 赋值，局部展开
srcs ?=       # 如果之前没有赋值，就赋值。之前已经赋值就再改变
srcs +=       # 追加赋值
$(srcs:.c=.o) # 替换srcs中所有的.c为.o
```

举个例子

```
t1_A = 1
t1_B = $(t1_A)  # t1_B = 2
t1_A = 2        # t1_A = 2

t2_A := 1
t2_B := $(t2_A) # t1_B = 1
t2_A := 2       # t1_A = 2

t3_A ?= 1
t3_B ?= $(t3_A) # t1_B = 1
t3_A ?= 2       # t1_A = 1

all:
	@echo "  = "
	@echo "t1_A=$(t1_A) t1_B=$(t1_B)" 
	@echo " := "
	@echo "t2_A=$(t2_A) t2_B=$(t2_B)"
	@echo " ?= "
	@echo "t3_A=$(t3_A) t3_B=$(t3_B)"

```


- 特殊变量

``` 
$@，表示规则中的目标。
$<，表示规则中的第一个依赖文件。
$?，表示规则中所有比目标新的条件，组成一个列表，以空格分隔。
$^，表示规则中的所有条件，组成一个列表，以空格分隔。
```

- 内嵌函数subst wildcard patsubst findstring filter 等
- 通配符%

```
# 遍历所有的.c文件编译生成同名的.o文件
%.o : %.c
    ${CC} -c ${CFLAGS} -o $@ $<
```

- 静态模式规则

```
objects = foo.o bar.o

all: $(objects)

$(objects): %.o: %.c
        $(CC) -c $(CFLAGS) $< -o $@
```



## 3. GNU Make运行选项

```
make <target> # 指定target或者运行(按文本从上到下扫描的)第一个target
  -j <jobs>   # 同时允许执行的命令数目，默认为1
  -n          # 打印要运行的命令，但是并不真正执行。用于调试。
  -d          # 打印makefile调试信息
  -B          # 大写B，强制重新运行所有命令
  -C <path>   # 大写C，等价于切换到<path>目录运行make
  -f <file>   # 使用<file>作为Makefile输入
  -I <path>   # 添加<path>为Makefile中的include查找目录
  2>&1 | tee run.log # shell命令：把所有出错信息都写入log文件

```

完整选项参考Make文档
```
man make
```
