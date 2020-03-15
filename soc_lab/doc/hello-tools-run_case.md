[TOC]

官方提供的验证环境中使用run_case脚本来运行仿真，这是一个perl语言编写的脚本，总共200多行。

wujian100_open/tools/run_case


# 使用方法

脚本中用到了文件目录的相对位置，需要切换到wujian100_open/workdir目录下运行。

## 运行命令

```
../tools/run_case [options] case_name
```

## 可选参数

```
[-h]: 打印帮助信息
[-nodump]: 关闭waveform dump，默认打开
[-sim_tool vcs|iverilog]: 指定仿真工具，可选项vcs和iverilog。
[-nomnt]: 关闭Testbench中的monitor模块，默认打开
```


## case_name

Example:
	../tools/run_case ../case/timer/timer_test.c


# 一些Perl库模块

## use Getopt::Long;

解析命令行参数

## use File::Copy

文件复制

## use Cwd;

获取当前目录(Current Working Directory)

## use FileHandle;

文件句柄，基于IO模块的扩展，比基础的open，close提供更多功能。

## use File::Basename;

把一个绝对路径的文件名解析为路径名称、文件名称、后缀名。

## use Term::ANSIColor;

改变终端打印的字符颜色


# 源码结构

## 1. 获取绝对路径名称(PROJ_DIR)

20~22行

- 使用linux的pwd命令获取当前目录：/your-path/wujian100_open/workdir
- 使用chomp去除换行符号
- 正则替换把workdir之后的字符替换

$wujian100_open_PATH = /your-path/wujian100_open

** 注意 ** your-path中不应该包含wujian100_open关键字：

/home/foo/wujian100_open-master/wujian100_open/workdir

## 2. 清空仿真目录(workdir)

24~45行

- 切换到workdir目录
- 使用linux的ls命令获取文件列表
- 遍历文件列表，如果不是CVS目录，就使用linux命令`rm -rf `进行删除

## 3. 命令行解析(GetOptions)

47~95行

- 使用GetOptions解析命令行参数保存到%Opt中
- 如果参数出错，或者输入了-h选项，执行子函数print_usage并退出
- 解析sim_tool设置`s_vcs`和`s_iverilog`选项，否则退出
- 如果使用了nodump选项，向仿真器传递`+define+NO_DUMP`
- 如果使用了nomnt选项，向仿真器传递`+define+NO_MONITOR`

## 4. 设置CPU型号(cpu_model)

97~113行
190~198行

- 设置CPU型号$cpu_model，开源版本只支持"e902";
- 根据CPU型号设置编译器选项
- 设置DATA_BADDR = 0x20000000 [TODO]


## 5. 复制test_case

115~174行

以../case/timer/timer_test.c为例

- 切换到运行目录workdir
- 使用正则表达式匹配得到$path=../case/timer/和$case=timer_test.c
- 如果$case是汇编代码(.s)：相关测试用例未开源。
- 如果$case是c代码(.c)
    - case_make = timer_test
    - @file ：使用`ls $path`获取$path目录下所有的文件名
    - 遍历@file
        - 跳过CVS目录：猜测使用CVS做版本管理
        - 复制文件到workdir
        - $had_v : 一些case目录下包含.v文件，需要加到后面的verilog文件列表
        - 注：161行的复制命令是冗余的
- 复制lib/clib目录下的.h .c文件到workdir
- lib/newlib_wrap/下的.c文件到workdir

在复制文件过程中如果出错(比如目录结构不全等)，脚本会退出


## 6. 编译C程序

177~210行

- 切换到运行目录workdir
- 判断cpu_model，如果不是e902则退出
- 复制../lib/Makefile到workdir
- 复制../lib/crt0.s到workdir
- 复制../lib/linker.lcf到workdir
- 使用sed命令把workdir/linker.lcf中的DATA_BADDR替换为0x20000000
- 使用Makefile进行编译，命令如下

```
make clean; 
make all \
    CPU=e902m \
    ENDIAN_MODE=little-endian \
    FILE=timer_test 
    HGPR=
```

TODO: 关于Makefile, crt0.s, linker.lcf文件的解析

## 7. 编译运行Verilog仿真

213~247行

### 7.1 使用vcs

- $g_vlib_path指定了需要编译的文件列表
- $vcs_incdir指定include目录
- $g_novas_pli或$PLItab用来设置Verdi
- 完整的编译命令行如下(以timer_test为例)

```
vcs  
+v2k   # 使用Verilog2001
-Mupdate # 增量编译
-sverilog    # 支持SystemVerilog
+nospecify   # 关闭工艺库仿真模型中的specify(延时信息)
+notimingchecks  # 关闭工艺库仿真模型中的时序检查
-timescale=1ns/100ps  # 指定timescale
/home/foo/proj/wujian100_open//tb/tb.v    # top模块
/home/foo/proj/wujian100_open//workdir/  # $had_v为空，gpio_test可见 
+incdir+../workdir+../soc/params+../tb # 指定include目录
+libext+.v+.sv+.inc+.h  # 指定库文件搜索的后缀名，与-y配套
-y ../tb/ # 在库文件目录搜索libext指定的文件名，需要module与文件名一致
-v ../tb/tb.v # -v指定verilog文件
-v ../tb/busmnt.v 
-v ../tb/virtual_counter.v 
-v ../soc/sim_lib/*.v # -v *.v匹配多个verilog文件
-v ../soc/*.v
-R   # 在编译后立即运行 如果没有这个选项，需要执行./simv
    # 与Verdi相关的选项需要用户自行配置
```

注：由于开源代码中的verilog文件module名与文件名不一致，vcs的-y和libext选项没有在soc目录下使用。

### 7.2 使用iverilog

https://github.com/steveicarus/iverilog

编译：

```
iverilog 
-o test.vvp   # 输出可执行文件名
-Diverilog=1  # define iverilog 1，在tb.v中有一些ifdef iverilog开关
-g2012        # 指定verilog标准，修改为2001
../tb/busmnt.v  # 文件列表
../tb/tb.v 
../tb/virtual_counter.v 
-f ../soc/wujian100_open_syn_for_iverilog.filelist # -f 导入可综合设计代码
-f ../soc/wujian100_open_lib_for_iverilog.filelist # -f 导入仿真库文件列表
$wujian100_open_PATH/workdir/  # $had_v为空，gpio_test可见

```

运行仿真：

```
vvp test.vvp
```

## 8. 测试报告

### 8.1 运行前
201~205行

在编译C文件之前，已经创建了run_case.report和../regress/regress_result/$case_make.report

初始化内容为"NOT RUN"

### 8.2 运行中

在tb/busmnt.v中，

- 以写模式打开run_case.report
- 写入“TEST PASS”或"TEST FAIL"
- 结束仿真

### 8.3 运行后 

复制run_case.report到regress目录并修改成相应case的名称

```
cp workdir/runase.report ../regress/regress_result/timer_test.report
```

综上，最终的report中可能出现的文本包括：

```
NOT RUN   # 没有启动verilog仿真，出错
TEST FAIL # verilog仿真结束，出错
TEST PASS # verilog仿真结束，正常
```

