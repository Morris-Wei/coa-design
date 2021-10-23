# 东南大学信息学院大三计算机组织结构实验
要求设计一个简单的**CPU**。该**CPU**拥有基本的指令集，并且能够使用指令集运行简单的程序。另外，CPU的**控制器**部分（CU）要求必须采用**微程序设计**方式。

1. 独立设计微程序控制器及外围的各寄存器。

2. 使用实验指导书中的1+2+…+100和相应的乘法例子来验证程序的正确性与完整性。

3. 要求完成并支持指令集中列出的所有指令。

4. 不得随意增加CPU内寄存器，不能随意增加控制器到各寄存器的控制线。必须采用微程序方式设计控制器，否则不予通过

## 命令及仿真
|  命令  |       解释        | 命令号 |
| :----: | :---------------: | :----: |
| store  |    存储进入RAM    |  0x01  |
|  load  |     装载到ALU     |  0x02  |
| store1 | 存储乘高位进入RAM |  0x11  |
|  add   |        加         |  0x03  |
|  sub   |        减         |  0x04  |
|  jmpz  |     为0时跳转     |  0x05  |
|  halt  |       停止        |  0x07  |


 > 计算1+2+…+100

```assembly
Load a0;(a0=0)
Add a1;
Store a0;
Load a1;
Sub a2;
Store a1;
JMPZ 0;
Load a0;
Halt;
```

![仿真一](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_08-58-19.png)
### 细节

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-19-10.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-20-35.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-23-45.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-25-11.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-26-34.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-27-57.png)
>
>计算0x1111*0x404

```
load a0;
mpy a1;
halt;
```

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_09-16-11.png)

>一正一负相乘

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-04-38.png)

>负数乘以负数

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_21-08-33.png)

>0x1111求反

```
load a0;
not a0;
```

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_09-28-26.png)

>0x1111与0x0404逻辑相与，相或

```
load a0;
and a1;
or a2;
```

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_13-11-28.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_13-45-42.png)

>0x0800逻辑左移与逻辑右移

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_13-57-14.png)

![](https://github.com/Morsen-wei/coa-design/blob/master/Snipaste_2020-04-03_20-51-48.png)

