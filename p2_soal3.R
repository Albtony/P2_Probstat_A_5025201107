# soal 3
# point a
# h0 : tidak ada perbedaan mean, mu1 = mu2
# h1 : ada pernedaan mean, mu1 != mu2

# point b 
x1 = 3.64
x2 = 2.79

n1 = 19
n2 = 27

s1 = 1.67
s2 = 1.32

sp_quad = ((n1-1)*(s1**2)+(n2-1)*(s2**2))/((n1-1)+(n2-1))
print(sp_quad)

# point c
tval = ((x1-x2)-(0))/sqrt((sp_quad)*((1/n1)+(1/n2)))
pval = 2*pt(q=tval, df=19-1, lower.tail=FALSE)
print(pval)

# point d
sigval = 0.05
critval = qt(p=sigval/2, df=2, lower.tail=FALSE)
print(critval)

# point e
# keputusan :
# 0.0699 > 0.5, p > 0.05

# point b
# kesimpulan :
# h0 diterima, tidak ada perbedaan antara mu1 dan mu2 