[TOC]

# 镜像文件格式ELF，S19，HEX，BIN

## 1 BIN

二进制文件就是直接的内存映像，是最终执行的机器码。BIN文件的大小就是数据的实际大小。BIN文件中不含地址信息。

## 2 S19/Motorola S-Record

是ASCII编码的文件，由帧数据组成。除了数据还包含地址等其他信息。

## 3 Hex

Intel的镜像格式，也是类似S19的ASCII文本，但是帧格式不同。

## 4 ELF (Executable and Linkable Format) 

是Linux系统下目标文件(objectfile)格式，包括三种类型:

- .o .a 目标文件(relocatablefile)
- 可执行文件(executable file)
- .so共享目标文件(shared object file)