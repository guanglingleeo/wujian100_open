[TOC]

# 运行Hello World仿真

手边如果没有EDA环境，可以使用开源工具iverilog + gtkwave，按照官方的README.md操作就可以了。

在虚拟机(Ubuntu 16.04.5 64bit)上实验成功，需要以下改动：

## 1. 可选：增加[setup.sh](../tools/setup.sh)

官方环境用的是csh，ubuntu默认是bash，可以新建一个./tools/setup.sh 设置相关的环境变量。也可以进入cshell环境运行。


## 2. iverilog -g2012问题

运行iverilog编译的时候，提示不支持`-g2012`选项。ubuntu 16.04 使用 sudo apt install iverilog安装的版本

```
$ iverilog -v
Icarus Verilog version 0.9.7  (v0_9_7)

Usage: iverilog [-ESvV] [-B base] [-c cmdfile|-f cmdfile]
                [-g1995|-g2001|-g2005] [-g<feature>]
                [-D macro[=defn]] [-I includedir] [-M depfile] [-m module]
                [-N file] [-o filename] [-p flag=value]
                [-s topmodule] [-t target] [-T min|typ|max]
                [-W class] [-y dir] [-Y suf] source_file(s)
```

### 2.1 在tools/run_case第241行

```
 把     "iverilog -o test.vvp -Diverilog=1 -g2012
 修改为 "iverilog -o test.vvp -Diverilog=1 -g2001
```

### 2.2 重新编译之后，会提示tb/tb.v第262行有语法错误

```
把     reg [31:0]  temp_mem[16384];
修改为 reg [31:0]  temp_mem[0:16383];
```

然后可以继续编译，并输出正确预期打印消息

```
Hello Friend!

timer test successfully
***************************************
*              Test Pass              *
***************************************
```

