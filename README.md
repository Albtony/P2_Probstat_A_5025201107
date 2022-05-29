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
h0 : tidak ada perbedaan mean, mu1 = mu2
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

