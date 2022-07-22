#### latex编辑公式

1. 行级元素(inline)，行级元素使用`$...$`，在正文行内使用，两个$表示公式的首尾。

  块级元素(displayed)，块级元素使用`$$...$$`，单独成行、自动居中。

  空格无效

  2.常用西文符号
  小写字母\alpha, \beta, …, \omega代表α,β,…ω. 大写字母,使用\Gamma, \Delta, …, \Omega代表Γ,Δ,…,Ω.

3. 上标与下标
	使用 `^` 和 `_` 表示上标和下标. 例如,`x_i^2`    \log_2x `A_{ij} = 2^{i+j}`
	$$
	x_i^2    /\log_2x/  A_{ij} = 2^{i+j}
	$$
	
	
	使用{ }来保证优先级问题。例如要显示10^10 ,正确的语法应该是10^{10}, 若写成10^10则会显示成
	$$
	10^{10}  和 10^10
	$$
	嵌套使用上下标时, 外层一定要分组
	
	
	
	有时需要在符号的左上, 左下角加上角标, 在要加角标字符前面使用空的{}
	
	${}_m^n H$
	$$
	{}_m^n H
	$$
	
4. 括号
    小括号和中括号直接使用，大括号由于因为用来表示优先级，所以需要转义。
$$
  \{1+2\}
$$

5. 运算

   - 分数：`\frac{}{}` 
     $$
     \frac{1+1}{2}+1
     $$

   - 求和：`\sum_1^n`
     $$
     求和：\sum_1^n
     $$

   - 连乘：`\prod_1^n`
     $$
     连乘：\prod_1^n
     $$

   - 积分：`\int_1^n`
     $$
     \int_1^n
     $$

   - 极限：`\lim_{x \to \infty}`
     $$
     \lim_{x \to \infty}
     $$

   - 矩阵：`$$\begin{matrix}…\end{matrix}$$`,使用&分隔同行元素，\换行。　例如：`\begin{matrix}1 & x & x^2 \\1 & y & y^2 \\1 & z & z^2 \\\end{matrix}`,则显示为：
     $$
     \begin{matrix}1 & x & x^2 \\1 & y & y^2 \\1 & z & z^2 \\ \end{matrix},
     $$
     

   ### 顶标与底标

   1. 角号：`\hat{a}`
      $$
      \hat{a}
      $$
      
   2. 横线：`\overline{a}`
      $$
      \overline{a}
      $$

   3. 箭头：`\stackrel{\rightarrow}{a}`
      $$
      \stackrel{\rightarrow}{a}
      $$

7.  集合关系

   - 属于：`\in`
     $$
     \in
     $$

   - 不属于：`\not\in`
     $$
     \not\in
     $$

   -  包含于：`A\subset B`
     $$
     A\subset B
     $$
     
   -  不包含于：`A\not\subset B`
     $$
     A\not\subset B
     $$
     
   - 交：`A\cap B`
     $$
     交：A\cap B
     $$
   
   - 并：`A\cup B`
     $$
     并：A\cup B
     $$
   
   -  空集：`\emptyset`
     $$
     空集：\emptyset
     $$
   
   



## 公式组合

通过cases环境实现公式的组合，&分隔公式和条件，还可以通过\limits来让x→0位于lim的正下方而非默认在lim符号的右下方显示

```latex
$$D(x) = \begin{cases}
\lim\limits_{x \to 0} \frac{a^x}{b+c}, & x<3 \\
\pi, & x=3 \\
\int_a^{3b}x_{ij}+e^2 \mathrm{d}x,& x>3 \\
\end{cases}$$
```

$$
D(x) = \begin{cases}
\lim\limits_{x \to 0} \frac{a^x}{b+c}, & x<3 \\
\pi, & x=3 \\
\int_a^{3b}x_{ij}+e^2 \mathrm{d}x,& x>3 \\
\end{cases}
$$



## 常用符号

### 数学符号

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f2f39e2896a~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp)

#### 不带上下限

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f41517df3ee~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp)

#### 带上下限

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f48764df5c2~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp)

#### `Latex`中的二元运算符

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f5300961369~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp)

### 标点

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f92fd9814ea~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp) 

![img](https://p1-jj.byteimg.com/tos-cn-i-t2oaga2asx/gold-user-assets/2020/2/5/17013f8b880f627a~tplv-t2oaga2asx-zoom-in-crop-mark:1304:0:0:0.awebp)

![image-20220628112808752](C:\Users\86172\AppData\Roaming\Typora\typora-user-images\image-20220628112808752.png)