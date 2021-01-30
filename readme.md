Does Routh-Hurwitz symbolically

```
syms s K;

G=(4500*K)/(s*(s+261.2));

RouthHurwitzSym(G)
```

will give

```math
\left(\begin{array}{cc}
5 & 22500\,K\\
1306 & 0\\
22500\,K & 0
\end{array}\right)

```


