# soal 4
# point a
df <- read.delim(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt"))
group = split(df, df$Group)

qqnorm(group$`1`$Length, 
       ylab = "cat length (in cms)",
       col = "dark green")
qqline(group$`1`$Length, 
       col = "red")

qqnorm(group$`2`$Length, 
       ylab = "cat length (in cms)",
       col = "dark green")
qqline(group$`2`$Length, 
       col = "red")

qqnorm(group$`3`$Length, 
       ylab = "cat length (in cms)",
       col = "dark green")
qqline(group$`3`$Length, 
       col = "red")

# point b
pval = bartlett.test(Length ~ Group, data = df)$p.value
print(pval)

# point c
library("ggpubr")
ggboxplot(df, x = "Group", y = "Length",
          color = "Group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("1", "2", "3"),
          ylab = "Lenght", xlab = "Group",
          title = "Model 1")

# point d
print(pval)
# nilai p > 0.05 sehingga H0 bersifat FTR, artinya saya tidak memiliki
# bukti yang cukup untuk menyatakan variansi antar grup adalah sama, sehingga 
# test anova dapat dilakukan

# point e
data.aov <- aov(Length ~ Group, data = df)
data.aov.factor = aov(Length ~ factor(Group), data = df)
TukeyHSD(data.aov.factor)

print(mean(group$`1`$Length))
print(mean(group$`2`$Length))
print(mean(group$`3`$Length))

# terdapat 3 p values yaitu
# p2-1 < 0.05, p3-1 > 0.05, p3-2 < 0.05
# artinya terdapat perbedaan yang signifikan antara grup 2-1 dan 2-3

# point f 
library(ggplot2)

ggplot(data=df, 
       mapping=aes(x=Length, fill=as.factor(Group))) + 
       geom_density(alpha=.3)
