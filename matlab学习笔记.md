# 基础

-   ；   不显示运行结果  分隔语句  无分号自动输出每个语句运行结果

-  clear   %清楚工作区变量

- clc     清空命令行

- 数字类型默认double

  [ ... ] 向量  可用，分割

  [  ;   ;] 矩阵   

一般   ： clear ；clc

## 输入输出,字符

1. disp()   %类似 print

   字符串：  单双引号皆可

2. 字符串合并：

   **strcat**('cd','ab')  或   ['ab','cd']

   num2str()    %字符串和数字转换 

3. length(str)%返回字符串长度

4. 输入： input   （类似python）

   ```matlab
   a=input('判断矩阵A=');%命令行输入
   disp(a);%
   ```

5. 输出disp() %显示文本或矩阵，数值  %类型要统一

   可以用num2str 同时输出字符和数值/向量

```matlab

%输出数字和字符串  ***  []内， 用   ，分隔
num = 1;
disp(['num:',num2str(num)])

```

## 计算函数

matlab内部对矩阵按列存储

1. ### sum（）

   - 对于向量[ ...]    直接求和

   -  对于矩阵E  默认按列求和  ------>得到一个行向量

     ```matlab
     	sum(E,1):  %等价于sum(E)按列求和  得到行向量
     	sum(E,2);    %按行求和  得到列向量
     ```
   
   
   
2. 提取矩阵指定行列的元素---下标访问（） 小括号

   ```matlab
   %%%单个元素
   A=[1 2 3;4 5 6;7 8 9]
   a=A(1,2);  %下标访问  下标从1开始
   disp(a); %显示2
   
   %%%%取某一行
   
   b=A(1,:)%取第一行的向量 (冒号代替列表)
   c=A(:,1)%取第一列同理
   
   %%%取某些行/列 的元素
   A([1,3],:)%只取第一行和第三行
   
   A(1:3,:)%取第一行到第三行
   A(1:2:3,:) %从第一行到第三行以2的步长取 
   A(3:-1:1,:)%步长可为负数
   A(1,end,:)%  end 为最后一行下标
   %类似python 的切片
   
   ```

   

3. ### size() 返回矩阵大小  -- 行 列数

   ```matlab
   [r,c]=size(A);
   r=size(A,1);%返回行数
   c=size(A,2)%返回列数
   ```

   

   ### 4.repmat 函数  将子矩阵复制到大矩阵

```matlab
A=[]

B=repmat(A,2,1)% 将A作为子矩阵元素以1*2 铺到B矩阵中
```

![image-20220713162703488](C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220713162703488.png)

## 矩阵运算

矩阵初始化

```matlab
A(1,2,3);
E=rand(3,2)   %  生成3*2的伪随机矩阵  值域[0,1)
E=randi(3,2,3) %  值域[1,3] 整型
E=randn(3,2,5) %  标准正态分布的伪随机数  浮点
A=zeros(2,3) %3*2的 0矩阵
ones() %1矩阵
```

### 关于NaN

比较NaN时用isnan（）函数

```matlab
a=nan;
if isnan(a)
	disp("fuck")
end
```



### 矩阵函数和数学函数

1. 矩阵乘法  A*B  %即可   除法   A *inv(B)
2. A+/-B矩阵之间加减
3. 加减常数 ------ 每个元素加减  A+1  （每个元素+1）
4. inv (A) %求逆  
5. A'   A的转置
6. 对应位置元素的乘除  .* 和 ./
7. A^2   矩阵乘方
8. A^n   n次方
9. A.^2 矩阵每个元素平方
10. det  求行列式
11. rank(X)   %秩
12. expm(x)  每个元素e^x      
13. sqrtm(x) 每个元素开方
14. logm(x)  
15. mod(x,y)       x%y
16. magic（n) 返回n阶幻方矩阵
17. abs 绝对值或复数的模

矩阵与常数：

​	.加与不加皆可

乘积 类似sum

```matlab
prod(A);prod(A,1)%  每列累乘得到行向量
prod(A,2)% 每行相乘

```

求特征值

```matlab
A=[1,2,3;2,2,1;2,0,3];
E=eig(A) %得到特征值构成的向量
[V,D]=eig(A) %同时得到特征值和特征向量  D为特征值构成的对角阵
% V每一列为对应特征向量 
```

### find()

返回向量或矩阵中不为0(或满足条件)的元素索引()

find(条件语句)返回第一个满足条件的元素

```matlab
%id=find(X)  按列优先排序的在所有元素中索引 1~n*m
[r,c]=find(X) %返回两个向量 r,c 分别为元素的行标列标
[r,c] =find(X,3)  ;%返回前三个不为0

```

矩阵与常数的判断运算---->返回logical数组 （0 1矩阵）

```matlab
A=[1,2,3;2,2,1;1,0,3];
A==1
ans =

  3×3 logical 数组

   1   0   0
   0   0   1
   1   0   0
  %%%
  
 [r1,c1]=find(A==1) %全部值为一的元素行标和列表向量
 r1 =
     1
     3
     2
c1 =
     1
     1
     3
[r2,c2]=find(A==1,2)%前两个值为一的元素行标和列表向量
r2 =

     1
     3


c2 =

     1
     1
```

```matlab
A=[1,2,3;2,2,1;1,0,3];
A==1
ans =

  3×3 logical 数组

   1   0   0
   0   0   1
   1   0   0
  %%%
  
 [r1,c1]=find(A==1) %全部值为一的元素行标和列表向量
 r1 =
     1
     3
     2
c1 =
     1
     1
     3
[r2,c2]=find(A==1,2)%前两个值为一的元素行标和列表向量

r2 =
     1
     3
c2 =
     1
     1
```

### max 

返回向量中最大元素（元素也可以是向量或矩阵）

或矩阵列中最大元素

```matlab
%向量中的最大元素
A = [23 42 37 18 52];
M = max(A)

52
%每个矩阵列中的最大元素
A = [2 8 4; 7 3 9]
M = max(A)

     7     8     9
     
 %每个矩阵行中的最大元素
 
 M = max(A,[],2)%注意第二个参数	
8
9
```

### sort

参数的元素进行升序排序或降序排序。sort()的参数可以是向量，矩阵，数组等等。当X是向量时，sort(X)对X的元素进行升序排序；当X是矩阵时，sort(X)对X的每一列进行升序排序；

**默认按列升序**  -----仅一个参数

#### Y=sort(X,DIM,MODE)

- dim=1   按列  对每一列排  dim=2 则按行
-  mode = 'ascend'  --升序  默认   ‘descend’  ----降序



#### [Y,I]=sort(X,DIM,MODE)

**I**为排序后的Y的向量在X中的索引（Y每个向量在X中对应位置）



# 冒号用法：

它用于创建向量，下标数组，并为迭代指定。

```matlab
1:10  % MATLAB执行语句并返回一个包含整数的行向量，从1到10
1:1:10 %与上等价   中间数确定步长
10:-1:1  %步长可为负
%%虚指整行/列
b=A(1,:)%取第一行的向量 (冒号代替列表)
c=A(:,1)%取第一列同理
```



#  程序控制语句

## 条件语句if

```matlab
x = 32 ; y = 86;
if x > y
    'x 大于 y'
elseif  x < y
    'x 小于 y'
elseif x == y
   ' x 等于y'
else 'error'
end  %一定要end结尾
```



## 循环

### 	for

- ### for 循环的基本格式:

  for 循环变量 = 起始值 : 步长 : 终止值 
   	 循环体 
  end

```matlab
% for循环使用示例
a = 0;
for i = 1:1:10
    a = a + i ;
end
a
%%%
a =

    55
```

## while

- ### while循环语句基本格式为

  while  表达式 
  	   循环体 
  end

```matlab
% while循环使用示例
num = 0; a = 5;
while a >1
    a = a/2;
    num = num + 1;
end
num
%%%%
num =

     3
```

# 自定义函数

***\*自定义函数名必须与文件名必须一致\****

```matlab
%自定义函数名必须与文件名必须一致
%function [输出变量]=函数名(输入变量)
%中间为函数题
%end结尾
%输入输出变量可有多个  
%自定义函数一定要单独放在m文件中，不可以直接放在主函数内（与其他语言不同）
function letGrade=letterGrade(n)
n=input('');
if n==9||n==10
    letGrade='A';
elseif n==8
    letGrade='B';
elseif n==7
    letGrade='C';
elseif n==6
    letGrade='D';
else
    letGrade='F';
```



# 绘图工具

## 绘制二维曲线

### plot函数

**plot(a) %**  以索引为横坐标

**plot(x,y)  %输入一对向量 绘制二维图像

**subplot**%同一个页面多张子图

曲线图，要提供一组x坐标和对应的y坐标，可以绘制分别以x和y为横、纵坐标的二维曲线。
例:

** 注意一定要用./    . *    .^

```matlab
t=0:0.1:2*pi;  %** 以0.1的步长在(0,2pi)中取点    创建对应向量
x=t; %对应t的分量 
y=t.*sin(t).*sin(t); 
%参数方程确定图像
plot(x, y);
%直接用x代替t也可
x=0:0.1:2*pi
xlabel ("横轴标题")
ylabel ("纵轴标题")
grid on;%显示网格
plot函数用法:
plot(x1,y1,x2,y2)

线方式： ‐ 实线  :点线  ‐. 虚点线  ‐ ‐ 波折线
点方式： . 圆点  +加号  * 星号  x x形  o小圆
颜色： y黄  r红  g绿  b蓝  w白  k黑  m紫  c青
```

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519000936588.png" alt="image-20220519000936588" style="zoom:33%;" /> 

### linspace函数：

#### 功能：产生等间隔的向量

输入参数：起点  终点  点总数量  (x1,x2,n)

第三个参数n默认100

```matlab
t=linspace(1,5)%  创建一个由区间 [1,5] 中的 100 个等距点组成的向量。
t=linspace(1,5,20)  %创建一个由区间 [1,5] 中的 20 个等距点组成的向量。
```

- 如果 `n` 为 `1`，则 `linspace` 返回 `x2`。
- 如果 `n` 为零或负数，则 `linspace` 返回 1×0 空矩阵。
- 如果 `n` 不是整数，则 `linspace` 向下舍入并返回 `floor(n)` 个点。

### 含多个输入参数的plot函数

plot函数可以包含若干组向量对，每一组可以绘制出一条曲线。含多个输入参数的plot函数调用格式为：plot(x1，y1，x2，y2，…，xn，yn)

```matlab
x=linspace(0,2*pi,100);
plot(x,sin(x),x,2*sin(x),x,3*sin(x))  % 3对向量   三条曲线
```

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519001443857.png" alt="image-20220519001443857" style="zoom:33%;" /> 

## 拓展：

3． 含选项的plot函数 matlab提供了一些绘图选项，用于确定所绘曲线的线型、颜色和数据点标记符号。这些选项如表所示：

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519001645690.png" alt="image-20220519001645690" style="zoom: 67%;" /> <img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519002019014.png" alt="image-20220519002019014" style="zoom: 50%;" />

```matlab
x=(0:pi/100:2*pi)';
y1=2*exp(-0.5*x)*[1,-1];
y2=2*exp(-0.5*x).*sin(2*pi*x);
x1=(0:12)/2;
y3=2*exp(-0.5*x1).*sin(2*pi*x1);
plot(x,y1,'k:',x,y2,'b--',x1,y3,'rp');  %各种符号组合  顺序可换

% 横坐标轴 
x = linspace(0, 2*pi, 50); 
% 生成数据点，纵坐标轴 
y = 2 * sin(pi * x); 
% 绘图 
figure 
% 设置线的宽带为3 
plot(x, y, 'k--^', 'LineWidth', 3, ...     
    'MarkerEdgeColor', 'k', ...  %设置标记点的边缘颜色为黑色     
    'MarkerFaceColor', 'r', ...  %设置标记点的填充颜色为红色     
    'MarkerSize', 10)    %设置标记点的尺寸为10 
```

### 辅助操作：

#### 1.图形标注

```matlab
title('图形名称')
xlabel('x轴说明’)
ylabel('y轴说明')
text(x,y,'图形说明')
legend('图例1’，’图例2’，…)
```

**title、xlabel和ylabel函数**分别用于说明**图形和坐标轴的名称。**
		text函数是在坐标点（x，y）处添加图形说明。
		legend函数用于绘制曲线所用线型、颜色或数据点标记图例，图例放置在空白处，用户还可以		通过鼠标移动图例，将其放到所希望的位置。
		除legend函数外，其他函数同样适用于三维图形，在三维中z坐标轴说明用zlabel函数。
		例:绘制正弦和余弦曲线，设置图形的标题、x 轴和 y 轴的标注，设置曲线标 准。

```matlab
% 横轴 
x=0:pi/50:2*pi; 
% 曲线数据 
y1=sin(x);  
y2=cos(x); 
% 绘图 
figure  %创建(新)绘图窗口
plot(x, y1, 'k-', x, y2, 'k-.') 
% 文本标注 
text(pi, 0.05, '\leftarrow sin(\alpha)')   %在(pi,0.05)位置标注
text(pi/4-0.05, 0.05, 'cos(\alpha)\rightarrow') 
% 标题标注 
title('sin(\alpha) and cos(\alpha)') 
% 坐标轴标注 
xlabel('\alpha')  
ylabel('sin(\alpha) and cos(\alpha)') 
```

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519002824111.png" alt="image-20220519002824111" style="zoom:50%;" /> 

#### 2.坐标控制：

axis（[xmin xmax ymin ymax zmin zmax]）
如果只给出前四个参数，则按照给出的**x、y轴**的最小值和最大值选择**坐标系范围**，绘制出合适的**二维曲线**。如果给出了全部6个参数，则绘制出**三维图形**。
axis函数的功能丰富，其常用的用法有:
**axis equal**：纵横坐标轴采用**等长刻度**
**axis square**：产生**正方形坐标系**（默认为矩形）
**axis auto**：使用默认设置
**axis off**：**取消**坐标轴
**axis on**：显示坐标轴
**axis tight**：按**紧凑方式显示坐标轴范围**，即坐标轴范围为绘图数据的范围
**grid on/off**：命令控制画还是不画**网格线**
例:观察曲线 **y=cos(tan(πx))在 x=0.5** 附近的图形曲线

```matlab
% x轴 
x = 0:1/3000:1;  
% 生成误差曲线 
y = cos(tan(pi*x)); 
% 绘图 
figure 
% 分裂窗口为2*1个子窗口 
subplot(2,1,1) 
plot(x,y) 
title('\itcos(tan(\pix))') 
% 坐标轴调整 
subplot(2,1,2) 
plot(x,y) 
axis([0.4 0.6 -1 1]); %限定坐标系范围  %若不在参数范围内则曲线截断
title('复杂函数的局部透视') 
```

## 绘制二维图形的其他函数

### 1. 对数坐标图

在实际应用中，经常用到对数坐标，Matlab提供了绘制对数和半对数坐标曲线的函数，其调用格式为：

```matlab
semilogx（x1，y1，选项1，x2，y2，选项2，…）
semilogy（x1，y1，选项1，x2，y2，选项2，…）
loglog（x1，y1，选项1，x2，y2，选项2，…）
```

这些函数中选项的定义和plot函数完全一样，所不同的是**坐标轴的选取**。
semilogx函数使用半对数坐标，x轴为常用对数刻度，而y轴仍保持线性刻度。semilogy恰好和semilogx相反。
loglog函数使用全对数坐标，x、y轴均采用对数刻度。
例：绘制函数 y=e^x

```matlab
% x轴 
x=0:0.5:5; 
% y轴 
y = exp(x); 
% 绘图 
figure 
% 笛卡尔坐标系 
subplot(4, 1, 1) 
% 分裂窗口为4*1个子窗口 
plot(x, y, 'r-.') 
title('笛卡尔坐标系') 
% 半对数坐标系 
subplot(4, 1, 2) 
semilogx(x, y, 'g:') 
title('x轴为对数坐标系') 
subplot(4, 1, 3) 
semilogy(x, y, 'b-') 
title('y轴为对数坐标系') 
% 对数坐标系 
subplot(4, 1, 4) 
loglog(x, y, 'k:','LineWidth',4) 
title('对数坐标系')
```

## 饼图：

- pie(x)：绘制数据 x 的饼图，x 可以是向量或者矩阵，x 中的每一个元素将代表饼图的一个扇区，同时饼图中显示各元素总和的比例。
- pie(x, explode)：绘制数据 x 的饼图，其中参数 explode 可以用来设置饼图中某个重要的扇区进行**抽取式重点显示**，这里需要注意的是，**explode 向量的长度与 x 中的元素个数相等**，并与 x 中的元素意义对应，**explode 元素为非零值**，**对应的元素扇区将从饼图中分离显示**，通常非零值都设置为 1。
- pie(x, labels)：绘制数据 x 的饼图，其中参数 **labels 可以用来设置饼图中各个扇区的显示标注**，注意参数 labels 应该为字符串或者数字利用向量 X中的数据描绘饼图
- 例:有一位研究生，在一年中平均每月的费用为生活费 190 元，资料费 33 元， 电话费 45 元，购买衣服 42 元，其他费用 45 元。请以饼图表示出他每月的消费比例，并在 饼图中分离出使用最多的费用和使用最少的费用的切片。

```matlab
% 数据准备 
x=[190 33 45 42 45]; 
% 分离显示设置 
explode=[1 1 0 0 0]; 
% 绘图 
figure() 
colormap hsv %色图
pie(x,explode,{'生活费','资料费','电话费','购买衣服','其他费用'}) 
title('饼图') 
```

 <img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519004318693.png" alt="image-20220519004318693" style="zoom:50%;" />

## 条形图

和饼图一样  就是函数名 为bar

bar ------垂直条形图

barh  ----- 水平条形图

```matlab
%随机函数产生5*3的数组，对产生的数据取整 
Y = round(rand(5,3)*10);  
% 绘图 
subplot(2,2,1) 
bar(Y,'group') 
title 'Group' 
%堆型二维垂直条形图 
subplot(2,2,2) 
bar(Y,'stack') 
title('Stack') 
%堆型二维水平条形图 
subplot(2,2,3) 
barh(Y,'stack') 
title('Stack') 
%设定条形的宽度为1.5 
subplot(2,2,4) 
bar(Y,1.5) 
title('Width = 1.5') 
```

 

​      <img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519004331397.png" alt="image-20220519004331397" style="zoom:50%;" /> 

## 极坐标图

**polarplot(theta,radi);**

```matlab
theta=0:0.01:2*pi;
radi=abs(sin(7*theta).*cos(10*theta));
polarplot(theta,radi);

```

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220526003909657.png" alt="image-20220526003909657" style="zoom:25%;" /> 

### 散点图：

scatter(x,y)

```matlab
x=randn(1000,1);
y=randn(1000,1);
scatter(x,y);

```

 ![image-20220526004219604](C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220526004219604.png) 

## 三维图形：

### 1.plot3函数

最基本的三维图形函数为plot3，它将二维绘图函数plot的有关功能扩展到三维空间，可以用来绘制三维曲线。其调用格式为：
plot3（x1，y1，z1，选项1，x2，y2，z2，选项2，…）
其中每一组x，y，z组成一组曲线的坐标参数，选项的定义和plot的选项一样。当x，y，z是同维向量时，则x，y，z对应元素构成一条三维曲线。当x，y，z是同维矩阵时，则以x，y，z对应列元素绘制三维曲线，曲线条数等于矩阵的列数。

### meshgrid()函数创建好平面（x,y）的点 

```matlab
[x,y]=meshgrid(-2;0.2;2);  %x y 的取值都为[-2,2]
z=x.*exp(-x.^2-y^2);
surf(x,y,z);
```



```matlab
t=0:pi/50:2*pi;
x=8*cos(t);
y=4*sqrt(2)*sin(t);
z=-4*sqrt(2)*sin(t);
plot3(x,y,z,'p');
title('Line in 3-D Space');
text(0,0,0,'origin');
xlabel('X');ylabel('Y');zlabel('Z');grid;
```

<img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220519004514599.png" alt="image-20220519004514599" style="zoom:50%;" /> 

### 三维网格图、切片图、表面图绘制：

略，见博客：

[数学建模之MATLAB画图汇总]:https://blog.csdn.net/sunyueqinghit/article/details/81905509?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522165288300116781432947911%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=165288300116781432947911&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~top_positive~default-1-81905509-null-null.142



## 子图

subplot():在同一窗口的不同子区域显示多个绘图

```matlab
x=0:0.1:10
% 两行一列的子图 
%%subplot (a,b,m)  a行b列 第m个
subplot(2,1,1);plot(x.^2);title("1");
subplot(2,1,2);plot(2.*x);title("2");
```

 <img src="C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220526005332833.png" alt="image-20220526005332833" style="zoom: 80%;" />

# 匿名函数



定义 f=@ (参数)  表达式

调用   f（实参）

```matlab

% 匿名函数的基本用法。
% handle = @(arglist) anonymous_function
% 其中handle为调用匿名函数时使用的名字。
% arglist为匿名函数的输入参数，可以是一个，也可以是多个，用逗号分隔。
% anonymous_function为匿名函数的表达式。
% 举个小例子
%  z=@(x,y) x^2+y^2; 
%  z(1,2) 
% % ans =  5
% fplot函数可用于画出匿名一元函数的图形。
% fplot(f,xinterval) 将匿名函数f在指定区间xinterval绘图。xinterval =  [xmin xmax] 表示定义域的范围
```

# excel相关

## 文件读取

```matlab
[data,str]=xlsread("data.xlsx");   %同时读取数值和字符
data=xlsread("data.xlsx");  %只有数值(矩阵，字符nan)
```





## load（‘data.mat’）

加载data.mat文件到变量data
