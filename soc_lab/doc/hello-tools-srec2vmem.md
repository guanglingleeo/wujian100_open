[TOC]

`wujian100_open/tools/Srec2vmem.py`是一个Python脚本，实现了SREC文件格式到verilog memory初始化文件格式的转换。

Motorola的S-Record文件(也被称作S19)不支持注释，每一行格式如下：

```
S   记录类型(1-9)   字节数量    地址    数据    校验码
```

# 使用方法

该脚本在`lib/Makefile`中被引用，在运行仿真的过程中被自动调用(参考0x020d lib/Makefile解析)。

## 运行命令


```
cd workdir
../tools/Srec2vmem.py -i <ifile_path> -o <ofile_path> -s [skip_mode]\n"

```

## 命令参数

- `<ifile_path>` 是C代码编译生成的二进制再进行转换得到的srec文件
- `<ofile_path>` 是用于verilog仿真初始化memory的文件，默认文件名`test.pat`，在../tb/tb.v中通过如下代码实现：
- `[skip_mode]`是可选参数，默认为'n'。在遇到memory地址不连续的情况下，在输出的memory文件中进行填0操作。如果输入其他字符串，比如'y'，会跳过那些地址。

```
// ../tb/tb.v

$readmemh("test.pat", temp_mem);
```

# 源码结构

## 调用关系

```
__main__ 
-> main() 
    -> argv_info()
    -> hex2vmem()
```

## 命令行参数解析

17 ~ 51 行

使用`getopt`模块进行命令行解析。


## 解析SREC文件格式并输出

53 ~ 176 行

### 打开文件，设置解析参数

```
char_bit_num  = 4
byte_char_num = 2
record_type_chars = 2
line_byte_chars   = 2
check_sum_chars   = 2
line_addr_num = 4
dat_split_unit = 8
get_base_addr  = False
base_addr = 0
```

### 循环遍历SREC每一行

- 读入一行，如果遇到文件结束，退出循环。

- 使用`re.match()`进行正则匹配

```
match_obj = re.match(r'^(S\d)(\w{2})', cur_line)

# 行首(^)  字母(S)  数字(\d)  2个字符(\w{2}

```

如果没有匹配到，说明输入SREC文件格式有错误，程序退出。

匹配的结果第一项是S0~S9，保存为record_type

接下来2个字符是十六进制表示的字节数，使用`int(xx,16)`转换为整形十进制保存为line_bytes。

- 检查record_type
    - S0 ：未处理
    - S1 ：addr_bits = 16 结束标志=S9
    - S2 ：addr_bits = 24 结束标志=S8
    - S3 ：addr_bits = 32 结束标志=S7
    - S4/S5/S6 ：保留字段，程序退出
    - S7/S8/S9 ：关闭文件。如果不是匹配的结束标志，程序退出。
- 确定地址、数据字段对应的字节位置 ：line_addr_idx，line_addr_end，line_data_idx
- 获取地址：转为10进制，以第一行地址为基准，后续地址转换为偏移量
- 处理skip_mode
- 获取数据并输出

注意：校验码字段未做处理
