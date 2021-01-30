Does Routh-Hurwitz symbolically

```matlab
syms s K;

G=(4500*K)/(s*(s+261.2));

RouthHurwitzSym(G)
```

will give

![img.png](img.png)


