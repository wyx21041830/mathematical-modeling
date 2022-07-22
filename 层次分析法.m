%%%层次分析法代码实现
clear;clc
disp('请输入判断矩阵A:')
A=input('判断矩阵A=')


%%%% 方法1：算数平均法求权重
%%%第一步  按照列归一化（A每个元素除以列所在的和）
Sum_A=sum(A);%按列求和得行向量
[n,n]=size(A);%方阵
SUM_A=repmat(Sum_A,n,1); %将行向量赋值n行
% SUM_A=[];
%     for i=1:n
%         SUM_A=[SUM_A:Sum_A]%将两矩阵合并
%     end
clc ;A
SUM_A
Stand_A=A./SUM_A;  
%这里将两个矩阵对应元素相除即可
%%%第二步 将归一化各列相加除n得权重向量
disp('算数平均法求权重的结果为：');
disp(sum(Stand_A,2)/n)    % /和./ 一样


%%方法2几何平均法
clc;A
Product_A=prod(A,2); %按行累乘得到新列向量
%%%再将向量每个分量开n次方
Product_A=Product_A.^(1/n)
%%%再取每个列向量平均值即可
disp('几何平均法结果为： ');
disp(Product_A./sum(Product_A))


%%%方法3 ：特征值法求权重
%求出矩阵A的最大特征值及其对应的特征向量  
clc

[V,D]=eig(A); %分别求出特征向量和对应特征值构成的对角阵
%求出最大特征值
Max_eig=max(max(D))  %也可写作 max(D(:)) 
D==Max_eig %返回logical矩阵
[r,c]=find(D==Max_eig,1) %找到第一个等于最大特征值的位置

%归一化得到权重
V(:,c)  %取第c行的切片
disp('特征值法求权重的结果为')
disp(V(:,c)./sum(V(:,c))) %归一化得权重  

%%计算一致性比例CR
clc
CI =(Max_eig-n)/(n-1)
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]
CR=CI/RI(n)
disp('一致性指标CI=');disp(CI);
disp('一致性比例CR=');disp(CR);

if CR<0.10
    disp('因为CR<0.10,所以该判断矩阵的一致性可以接受')
else 
   disp('注意： CR>=0.10,因此该判断矩阵A需要进行修改')
end