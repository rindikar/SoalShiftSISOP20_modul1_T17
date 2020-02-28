# SoalShiftSISOP20_modul1_T17
Nama Anggota Kelompok T17 :
  1. Faza Murtadho [05311840000034]
  2. Rindi Kartika Sari [05311840000013]

## Soal Shift Modul 1 dan Penyelesaian Soal Shift Modul 1
### Soal 1
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikumuntuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
Namun dia tidak dapat menyelesaikan tugas tersebut. Whits memohon kepada kalian yang sudah jago mengolah data untuk mengerjakan
laporan tersebut. Laporan yang diminta berupa :
* #### Soal 1A
  Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit!
  #### Code : https://github.com/rindikar/SoalShiftSISOP20_modul1_T17/blob/master/Revisi_Soal1.sh
  #### Penyelesaian :
  ```bash
  echo "Region profit terkecil: "
  awk -F '\t' 'NR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2 {print$1}'
  ```
  * Pada ```echo "Region profit terkecil: " ``` akan menampilkan __region profit terkecil__ yang akan dicari melalui pengeksekusian command __awk__ yang tertera di bawah command ini.
  * Command ```awk -F '\t' 'NR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2 {print$1}'```
  sangat dibutuhkan untuk membantu kita dalam menemukan region mana yang memiliki profit terkecil. Disini kita menggunakan command ```awk``` agar mampu melakukan penyaringan data dari file  _ _Sampe-Superstore.tsv_ _ <br>
  Command ```-F``` digunakan sebagai, _field separator_ , mengontrol cara __awk__ dalam memberikan suatu pemisah antar kalimat dari catatan input. <br>
  Pemisah yang digunakan adalah __tab__ yang merupakan fungsi dari command ```'\t'```