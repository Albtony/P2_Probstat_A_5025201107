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
    width="300"
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


