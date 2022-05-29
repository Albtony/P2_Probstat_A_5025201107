# no 2
install.packages("BSDA")
library(BSDA)

n = 100
mean =23500
sdev = 3900
dataset = rnorm(n, mean, sdev)

t_mu = 20000
t.test(dataset, akternative='two.sided', mu = t_mu)

# point a
# jawab : 
# ya, karena hasil t test menunjukkan nilai p adalah signifikan
# sehingga menolak H0, dengan CI 95% dan rentang nilai  22992.39 - 24519.21

# point b 
# jawab : 
# ditemukan nilai tval = 9.0723 yang menunjukkan adanya perbedaan besar antara
# hasil perhitungan dengan asumsi awal, nilai p yang < 0.025 yang berarti 
# significance test menyatakan h0 dapat ditolak.Dihasilkan juga selang kepercayaan
# dengan rata-rata jarak tempuh 22645 hinggga 24126

# point c
# p value yang dihasilkan memiliki nilai lebih kecil daripada 0.025, sehingga
# hipotesis null ditolak.
