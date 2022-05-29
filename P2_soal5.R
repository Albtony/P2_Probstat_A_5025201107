# soal 5
install.packages("ggplot2")
install.packages("multcompView")
install.packages("readr")
install.packages("dplyr")
library(ggplot2)
library(multcompView)
library(readr)
library(dplyr)

df <- read.csv(url("https://docs.google.com/uc?export=download&id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ"))

# point a
qplot(x = Temp, y = Light, color = Glass, geom = "point", data = df) +
      facet_grid(.~Glass, labeller = label_both)

# point b  
df$Glass <- as.factor(df$Glass)
df$Temp <- as.factor(df$Temp)
data.aov2 <- aov(Light ~ Temp * Glass, data = df)
summary(data.aov2)

# point c
group_by(df, Glass, Temp) %>%
  summarise(
    count = n(),
    mean = mean(Light, na.rm = TRUE),
    sd = sd(Light, na.rm = TRUE)
  )

# point d
data.aov2.factor = aov(Light ~ Temp * Glass, data = df)
tukey = TukeyHSD(data.aov2.factor)
print(tukey)

# point e
cld = multcompLetters4(data.aov2, tukey)
print(cld)