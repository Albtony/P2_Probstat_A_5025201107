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
