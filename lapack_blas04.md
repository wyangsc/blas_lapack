# 最小二乘法

## 原理

由$$X_1,X_2,...,X_n$$的m次观测去估计$$Y$$的行为

我们将观测写成一个矩阵

$$X=\left( \begin{array}{ccccc} X_{11} & X_{12} & X_{13}& \cdots  &X_{1n} \newline X_{21}& X_{22} & X_{23} & \cdots & X_{2n} \newline X_{31}& X_{32} & X_{33} & \cdots & X_{3n}  \newline \vdots & \vdots &   \vdots &\ddots & \vdots \newline X_{m1} & X_{m2} & X_{m3} &\cdots &X_{mn} \end{array}\right)$$

行代表一次观测，列代表一个变量。

对应对Y的观测记为

$$Y=\left( \begin{array}{c} Y_{1}  \newline Y_2 \newline Y_3 \newline \vdots\newline Y_m \end{array}\right)$$

我们的目标是寻在一个K系数向量使得$$min||XK-Y||$$

### 1、X行满秩

由于行秩等于列秩，则X的列向量的极大无关组中有ｍ个向量，这样按列生成的$$span(X)＝R^m$$

则这个方程一定有唯一解！

###2、X不是行满秩但是X列满秩

这时候有可能$$Y\notin span(X)$$，这时候我们可以用Y在span(X)中的投影$$Y^{'}$$逼近Y

即$$(Y-Y')\perp span(X) => X^T(Y-AK)=0$$

即$$X^TXK=X^TY$$

由于X是列满秩的矩阵，则$$X^TX$$一定可逆，上式存在唯一解。

### 3、X行列均不满秩

此时在２中的$$X^TX$$不是一个可逆的矩阵,问题会复杂一些。对于$$XK=0$$解空间$$W\perp span(X^T)$$,记$$r(X)=r$$

则$$r(W)=n-r$$

而且$$R^n=W\oplus span(X^T)$$

对于任意给定的$$XK=Y^{'}$$的一个解$$K^{'}$$,$$K^{'}=u+v  , u\in W ,v\in span(X^T)$$

$$XK^{'}=Xu+Xv=Xv=Y^{'}$$则最小二乘法的解是核空间在$$v$$下的陪集即$$v+W$$

$$||K^{'}||=||u||+||v||$$则模最小的解在$$span(X^T)$$中即为$$v$$。

$$v=A^+Y,A^+=\overline{R}^T(R\overline{R})^{-1}(\overline{C}^TC)^{-1}\overline{C}^T,A=CR​$$

取广义逆

### lapack最小二乘法的求解（ex03.f90）

| Operation                                         | Single precision | Double precision |        |         |
| ------------------------------------------------- | ---------------- | ---------------- | ------ | ------- |
|                                                   | real             | complex          | real   | complex |
| solve LLS using *QR* or *LQ* factorization        | SGELS            | CGELS            | DGELS  | ZGELS   |
| solve LLS using complete orthogonal factorization | SGELSY           | CGELSY           | DGELSY | ZGELSY  |
| solve LLS using SVD                               | SGELSS           | CGELSS           | DGELSS | ZGELSS  |
| solve LLS using divide-and-conquer SVD            | SGELSD           | CGELSD           | DGELSD | ZGELSD  |



| Operation                   | Single precision | Double precision |        |         |
| --------------------------- | ---------------- | ---------------- | ------ | ------- |
|                             | real             | complex          | real   | complex |
| solve LSE problem using GRQ | SGGLSE           | CGGLSE           | DGGLSE | ZGGLSE  |
| solve GLM problem using GQR | SGGGLM           | CGGGLM           | DGGGLM | ZGGGLM  |