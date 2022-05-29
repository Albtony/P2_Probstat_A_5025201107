# no 1
# point a
responden = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

observasi_df = data.frame(responden, x, y)
sdev = sd(observasi_df$y - observasi_df$x)
print(sdev)

# point b
xmean = mean(observasi_df$x)
ymean = mean(observasi_df$y)
xvar = sd(observasi_df$x)**2
yvar = sd(observasi_df$y)**2

tval = (ymean - xmean)/(yvar + xvar)
pval = pt(tval, df=9-1)
print(pval)

# point c
diff = observasi_df$y - observasi_df$x

sigval = 0.05
crit_zval = abs(qnorm(sigval/2))
calc_zval = (mean(diff) -  0)/(sd(diff)/sqrt(9))

if((calc_zval < crit_zval &&  
   calc_zval > (-1 * crit_zval)) ||
   calc_zval == crit_zval){
  print("null hypothesis accepted")
} else {
  print("null hypothesis rejected")
}
