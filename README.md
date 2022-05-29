# P2_Probstat_A_5025201107
Berikut adalah lampiran mengenai apa yang telah saya kerjakan di praktikum probstat yang ke-dua

## Nomor 1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali adar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴.

<p align="center">
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170879895-e0a766e0-c23c-4122-9f6d-731229c8068f.png"
  >
</p>

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

#### Poin A
Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas.
```
responden = c(1, 2, 3, 4, 5, 6, 7, 8, 9)
x = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)

observasi_df = data.frame(responden, x, y)
sdev = sd(observasi_df$y - observasi_df$x)
print(sdev)

[1] 6.359595
```

#### Poin B
carilah nilai t (p-value).
```
xmean = mean(observasi_df$x)
ymean = mean(observasi_df$y)
xvar = sd(observasi_df$x)**2
yvar = sd(observasi_df$y)**2

tval = (ymean - xmean)/(yvar + xvar)
pval = pt(tval, df=9-1)
print(pval)

[1] 0.5670903
```

#### Poin C
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen, sebelum dan sesudah melakukan aktivitas 𝐴”

```
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

[1] "null hypothesis rejected"
```

Sesuai dengan kode yang dilampirkan, karena nilai z yang dihitung berada pada rejection zone, maka H0 ditolak.

## Nomor 2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun.Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul).

#### Point A
```
data:  dataset
t = 9.7619, df = 99, p-value = 3.618e-16
alternative hypothesis: true mean is not equal to 20000
95 percent confidence interval:
 22992.39 24519.21
sample estimates:
mean of x 
  23755.8 
```
Apakah Anda setuju dengan klaim tersebut?
ya, karena hasil t test menunjukkan nilai p adalah signifikan sehingga menolak H0, dengan CI 95% dan rentang nilai  22992.39 - 24519.21 yang mana berada diatas 20.000.

#### Point B
Jelaskan maksud dari output yang dihasilkan!
ditemukan nilai tval = 9.0723 yang menunjukkan adanya perbedaan besar antara hasil perhitungan dengan asumsi awal, nilai p yang < 0.025 yang berarti significance test menyatakan h0 dapat ditolak. Dihasilkan juga selang kepercayaan dengan rata-rata jarak tempuh 22645 hinggga 24126.

#### Point C
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
p value yang dihasilkan memiliki nilai lebih kecil daripada 0.025, sehingga hipotesis null ditolak.

## Nomor 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.

<p align="center">
  <img 
    width="600"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170880928-144554af-8692-4493-a3e6-d2dbdbca447e.png"
  >
</p>

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

#### Point A
H0 dan H1
h0 : tidak ada perbedaan mean, mu1 = mu2 <br>
h1 : ada pernedaan mean, mu1 != mu2

#### Point B
Hitung Sampel Statistik
```
x1 = 3.64
x2 = 2.79

n1 = 19
n2 = 27

s1 = 1.67
s2 = 1.32

sp_quad = ((n1-1)*(s1**2)+(n2-1)*(s2**2))/((n1-1)+(n2-1))
print(sp_quad)

[1] 2.170514
```

#### Point C
Lakukan Uji Statistik (df =2)
```
tval = ((x1-x2)-(0))/sqrt((sp_quad)*((1/n1)+(1/n2)))
pval = 2*pt(q=tval, df=19-1, lower.tail=FALSE)
print(pval)

[1] 0.06995324
```

#### Point D
Nilai Kritikal
```
sigval = 0.05
critval = qt(p=sigval/2, df=2, lower.tail=FALSE)
print(critval)

[1] 4.302653
```

#### Point E
Keputusan
didapat p = 0.0699 > 0.5, p > 0.05

#### Point F
Kesimpulan
h0 diterima, tidak ada perbedaan antara mu1 dan mu2 

## Nomor 4
Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data tiga spesies kucing yaitu kucing oren, kucing hitam dan
kucing putih dengan panjangnya masing-masing.

Jika :
diketahui dataset https://intip.in/datasetprobstat1

H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama
Maka Kerjakan atau Carilah:


<p align="center">
  <img 
    width="100"
    height="400"
    src="https://user-images.githubusercontent.com/78489357/170881245-e47f489b-0033-4f3a-ae6c-a2cb69f70709.png"
  >
</p>

#### Point A
Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1, grup 2, grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.

```
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
```

<p align="center">
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881379-8c472a54-33c1-453d-963b-ccbcb80d7d9c.png"
  >
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881422-8c7570f7-da02-4b8d-9a98-a4fbd2f58d64.png"
  >
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881403-bef2b4ae-7135-4a86-b8f8-5623e1333df2.png"
  >
</p>

#### Point B
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?

```
pval = bartlett.test(Length ~ Group, data = df)$p.value
print(pval)
  
0.8053635
```
  
#### Point C
Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1  
```
library("ggpubr")
ggboxplot(df, x = "Group", y = "Length",
          color = "Group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("1", "2", "3"),
          ylab = "Lenght", xlab = "Group",
          title = "Model 1")

```

<p align="center">
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881558-42fa1918-07e4-4bd5-851d-0215952c1658.png"
  >
</p>

#### Point D
Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
nilai p > 0.05 sehingga H0 bersifat FTR, artinya saya tidak memiliki bukti yang cukup untuk menyatakan variansi antar grup adalah sama, sehingga test anova dapat dilakukan

#### Point E
Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai pyang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.

```
data.aov <- aov(Length ~ Group, data = df)
data.aov.factor = aov(Length ~ factor(Group), data = df)
TukeyHSD(data.aov.factor)

print(mean(group$`1`$Length))
print(mean(group$`2`$Length))
print(mean(group$`3`$Length))

[1] 18.46571
[1] 17.74571
[1] 18.36286
```

terdapat 3 p values yaitu p2-1 < 0.05, p3-1 > 0.05, p3-2 < 0.05 artinya terdapat perbedaan yang signifikan antara grup 2-1 dan 2-3

#### Point F
Visualisasikan data dengan ggplot2

```
library(ggplot2)

ggplot(data=df, 
       mapping=aes(x=Length, fill=as.factor(Group))) + 
       geom_density(alpha=.3)
```

<p align="center">
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881694-7e0a6ad5-6aa7-4b4b-9fa3-d269bc0b955b.png"
  >
</p>

## Nomor 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca
pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

<p align="center">
  <img 
    width="150"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170882159-1289679f-a0c0-4f66-a51d-9a43478eaecc.png"
  >
</p>

```
df <- read.csv(url("https://docs.google.com/uc?export=download&id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ"))
```

#### Point A
Buatlah plot sederhana untuk visualisasi data

```
qplot(x = Temp, y = Light, color = Glass, geom = "point", data = df) +
      facet_grid(.~Glass, labeller = label_both)
```

<p align="center">
  <img 
    width="300"
    height="300"
    src="https://user-images.githubusercontent.com/78489357/170881890-7afd782b-1d83-44f7-95b5-69a28a9a5ad4.png"
  >
</p>

#### Point B
Lakukan uji ANOVA dua arah

```
df$Glass <- as.factor(df$Glass)
df$Temp <- as.factor(df$Temp)
data.aov2 <- aov(Light ~ Temp * Glass, data = df)
summary(data.aov2)

            Df  Sum Sq Mean Sq F value   Pr(>F)    
Temp         2 1970335  985167  2695.3  < 2e-16 ***
Glass        2  150865   75432   206.4 3.89e-13 ***
Temp:Glass   4  290552   72638   198.7 1.25e-14 ***
Residuals   18    6579     366                     
```

#### Point C
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)

```
group_by(df, Glass, Temp) %>%
  summarise(
    count = n(),
    mean = mean(Light, na.rm = TRUE),
    sd = sd(Light, na.rm = TRUE)
  )
  
  # A tibble: 9 × 5
# Groups:   Glass [3]
  Glass Temp  count  mean    sd
  <fct> <fct> <int> <dbl> <dbl>
1 A     100       3  573.  6.43
2 A     125       3 1087.  2.52
3 A     150       3 1386   6   
4 B     100       3  553  24.6 
5 B     125       3 1035  35   
6 B     150       3 1313  14.5 
7 C     100       3  573. 26.5 
8 C     125       3 1055. 10.6 
9 C     150       3  887. 18.6 
```

#### Point D
Lakukan uji Tukey

```
data.aov2.factor = aov(Light ~ Temp * Glass, data = df)
tukey = TukeyHSD(data.aov2.factor)
print(tukey)

Tukey multiple comparisons of means
    95% family-wise confidence level

Fit: aov(formula = Light ~ Temp * Glass, data = df)

$Temp
            diff      lwr      upr p adj
125-100 492.6667 469.6651 515.6682     0
150-100 628.8889 605.8874 651.8904     0
150-125 136.2222 113.2207 159.2238     0

$Glass
          diff        lwr       upr     p adj
B-A  -48.33333  -71.33487  -25.3318 0.0001206
C-A -177.11111 -200.11265 -154.1096 0.0000000
C-B -128.77778 -151.77932 -105.7762 0.0000000

$`Temp:Glass`
                    diff        lwr         upr
125:A-100:A  514.6666667  459.97060  569.362729
150:A-100:A  813.3333333  758.63727  868.029396
100:B-100:A  -19.6666667  -74.36273   35.029396
125:B-100:A  462.3333333  407.63727  517.029396
150:B-100:A  740.3333333  685.63727  795.029396
100:C-100:A    0.6666667  -54.02940   55.362729
125:C-100:A  482.0000000  427.30394  536.696063
150:C-100:A  314.0000000  259.30394  368.696063
150:A-125:A  298.6666667  243.97060  353.362729
100:B-125:A -534.3333333 -589.02940 -479.637271
125:B-125:A  -52.3333333 -107.02940    2.362729
150:B-125:A  225.6666667  170.97060  280.362729
100:C-125:A -514.0000000 -568.69606 -459.303937
125:C-125:A  -32.6666667  -87.36273   22.029396
150:C-125:A -200.6666667 -255.36273 -145.970604
100:B-150:A -833.0000000 -887.69606 -778.303937
125:B-150:A -351.0000000 -405.69606 -296.303937
150:B-150:A  -73.0000000 -127.69606  -18.303937
100:C-150:A -812.6666667 -867.36273 -757.970604
125:C-150:A -331.3333333 -386.02940 -276.637271
150:C-150:A -499.3333333 -554.02940 -444.637271
125:B-100:B  482.0000000  427.30394  536.696063
150:B-100:B  760.0000000  705.30394  814.696063
100:C-100:B   20.3333333  -34.36273   75.029396
125:C-100:B  501.6666667  446.97060  556.362729
150:C-100:B  333.6666667  278.97060  388.362729
150:B-125:B  278.0000000  223.30394  332.696063
100:C-125:B -461.6666667 -516.36273 -406.970604
125:C-125:B   19.6666667  -35.02940   74.362729
150:C-125:B -148.3333333 -203.02940  -93.637271
100:C-150:B -739.6666667 -794.36273 -684.970604
125:C-150:B -258.3333333 -313.02940 -203.637271
150:C-150:B -426.3333333 -481.02940 -371.637271
125:C-100:C  481.3333333  426.63727  536.029396
150:C-100:C  313.3333333  258.63727  368.029396
150:C-125:C -168.0000000 -222.69606 -113.303937
                p adj
125:A-100:A 0.0000000
150:A-100:A 0.0000000
100:B-100:A 0.9307049
125:B-100:A 0.0000000
150:B-100:A 0.0000000
100:C-100:A 1.0000000
125:C-100:A 0.0000000
150:C-100:A 0.0000000
150:A-125:A 0.0000000
100:B-125:A 0.0000000
125:B-125:A 0.0670029
150:B-125:A 0.0000000
100:C-125:A 0.0000000
125:C-125:A 0.5065610
150:C-125:A 0.0000000
100:B-150:A 0.0000000
125:B-150:A 0.0000000
150:B-150:A 0.0045830
100:C-150:A 0.0000000
125:C-150:A 0.0000000
150:C-150:A 0.0000000
125:B-100:B 0.0000000
150:B-100:B 0.0000000
100:C-100:B 0.9179607
125:C-100:B 0.0000000
150:C-100:B 0.0000000
150:B-125:B 0.0000000
100:C-125:B 0.0000000
125:C-125:B 0.9307049
150:C-125:B 0.0000006
100:C-150:B 0.0000000
125:C-150:B 0.0000000
150:C-150:B 0.0000000
125:C-100:C 0.0000000
150:C-100:C 0.0000000
150:C-125:C 0.0000001
```

#### Point E
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

```
cld = multcompLetters4(data.aov2, tukey)
print(cld)

$Temp
150 125 100 
"a" "b" "c" 

$Glass
  A   B   C 
"a" "b" "c" 

$`Temp:Glass`
150:A 150:B 125:A 125:C 125:B 150:C 100:C 100:A 100:B 
  "a"   "b"   "c"   "c"   "c"   "d"   "e"   "e"   "e" 
```
