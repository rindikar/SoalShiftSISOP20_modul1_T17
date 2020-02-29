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
  sangat dibutuhkan untuk membantu kita dalam menemukan region mana yang memiliki profit terkecil. Disini kita menggunakan command ```awk``` agar mampu melakukan penyaringan data dari file  _Sampe-Superstore.tsv_ <br>
  Command ```-F``` digunakan sebagai, _field separator_ , mengontrol cara __awk__ dalam memberikan suatu pemisah antar kalimat dari catatan input. <br>
  Pemisah yang digunakan adalah __tab__ yang merupakan fungsi dari command ```'\t'```. <br>
  Command ```NR > 1``` digunakan untuk menyimpan jumlah _record_ yang dibaca mulai dari kolom kedua dikarenakan kolom pertama merupakan header dari setiap kolom. Kolom yang dibaca adalah kolom dari __region__ dan __profit__. <br>
  Command ```{SUM[$13] +=$21}``` menunjukkan bahwa __variabel SUM__ dibuat untuk menyimpan ```+=$21``` __jumlah profit__ (kolom ke-21) dari  ```[$13]``` __per region__ (kolom ke-13). <br>
  Setelah proses ```awk``` selesai, maka command ```END{for (j in SUM) print j, SUM[j]}``` dieksekusi agar dalam program tercatat semua __region__ disertai dengan __jumlah profit per region__.  Hal ini menjadikan catatan input terdiri atas dua kolom yaitu kolom pertama diisi dengan  __region__ dan kolom kedua diisi dengan __jumlah profit per region__. <br>
  ```Sample-Superstore.tsv``` menunjukkan bahwa proses ```awk``` dieksekusi untuk data yang ada di dalam file bernama _Sample-Superstore.tsv_. <br>
  Setelah penyaringan data __region__ dan __jumlah profit per region__ telah didapatkan, proses dilanjutkan dengan ```sort -gk2``` penyortingan atau pengurutan data berdasarkan ```k2``` __jumlah profit per region__ (kolom kedua dari catatan input) sesuai dengan ```-g``` _generic number_ . <br>
  Setelah proses penyortingan telah selesai dilakukan, data yang telah terurut tersebut disaring kembali dengan ```awk``` dengan ```FNR < 2``` hanya mengambil __baris pertama__ saja. Dan di akhir proses, program ```{print$1}``` kolom pertama dari baris pertama yang telah disaring sebelumnya yaitu __region__ yang memiliki profit paling sedikit. 
* #### Soal 1B
  Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin __A__!
  #### Code : https://github.com/rindikar/SoalShiftSISOP20_modul1_T17/blob/master/Revisi_Soal1.sh
  #### Penyelesaian :
  ```bash
  echo "2 State profit terkecil: "
  awk -F '\t' 'NR > 1{if( $13=="Central" ){SUM[$11] +=$21}} END{for (j in SUM) print j", " SUM[j] | "sort -t ',' -g -k2"}' Sample-  Superstore.tsv | head -n 2
  #| sort -k2 
  #| awk FNR < 3{print$1$2}'
  ```
  * Pada ```echo "2 State profit terkecil: "``` akan menampilkan __2 state profit terkecil__ dari region yang didapatkan pada poin 1A. 
  * Untuk mencari dua state yang memiliki profit terkecil dari region yang juga memiliki profit terkecil, maka kita juga menggunakan command ```awk``` guna mampu melakukan penyaringan data tertentu dari suatu file. <br>
   Command ```-F``` digunakan sebagai, _field separator_ , mengontrol cara __awk__ dalam memberikan suatu pemisah antar kalimat dari catatan input. <br>
  Pemisah yang digunakan adalah __tab__ yang merupakan fungsi dari command ```'\t'```. <br>
  Command ```NR > 1``` digunakan untuk menyimpan jumlah _record_ yang dibaca mulai dari kolom kedua dikarenakan kolom pertama merupakan header dari setiap kolom.  <br>
  Sebelum mengetahui kolom mana saja yang dibaca, kita perlu mengetahui hasil dari poin __1A__ dimana region yang memiliki profit terkecil adalah __Central__ maka dengan adanya ```{if( $13=="Central" )``` menandakan bahwa program hanya akan mengeksekusi dua kolom dari region _Central_ yaitu kolom __state__ dan kolom __profit__. <br>
  Kedua kolom tersebut disimpan dalam ```{SUM[$11] +=$21}}``` __variabel SUM__ yang akan terdiri dari kolom __state__ (kolom ke-11) dan __jumlah profit per state__ (kolom ke-21). <br>
  Setelah proses ```awk``` selesai, maka command ```END{for (j in SUM) print j, SUM[j]}``` dieksekusi agar dalam program tercatat semua __state__ disertai dengan __jumlah profit per state__.  Hal ini menjadikan catatan input terdiri atas dua kolom yaitu kolom pertama diisi dengan  __state__ dan kolom kedua diisi dengan __jumlah profit per state__. <br>
   Setelah penyaringan data __state__ dan __jumlah profit per state__ telah didapatkan, proses dilanjutkan dengan ```sort -t ',' -g -k2``` penyortingan atau pengurutan data __state__ dengan disertai pemisah ```-t ','``` berdasarkan ```k2``` __jumlah profit per state__ (kolom kedua dari catatan input) sesuai dengan ```-g``` _generic number_ . <br>
    ```Sample-Superstore.tsv``` menunjukkan bahwa proses ```awk``` dieksekusi untuk data yang ada di dalam file bernama _Sample-Superstore.tsv_. <br>
    Setelah data penyortingan kedua kolom didapatkan yakni kolom __state__ dan kolom __jumlah profit per state__, proses dilanjutkan dengan ```head -n 2``` yaitu melihat isi dua baris awal dari kedua kolom dalam data penyortingan tersebut. <br>
    Kedua baris tersebut diurutkan lagi berdasarkan __jumlah profit per state__ dengan command ```sort -k2 ```. <br>
     Setelah proses penyortingan telah selesai dilakukan, data yang telah terurut tersebut disaring kembali dengan ```awk``` dengan ```FNR < 3``` menandakan bahwa program mengambil __baris pertama__ dan __baris kedua__.  Hal ini dikarenakan dua baris awal dari data penyortingan merupakan dua data terkecil. Dan di akhir proses, program ```{print$1$2}```  menampilkan kolom pertama dari kedua baris dan kolom kedua dari kedua baris yang telah disaring sebelumnya yaitu __2 state profit terkecil__. <br>
* #### Soal 1C
  Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin __B__!
  #### Code : https://github.com/rindikar/SoalShiftSISOP20_modul1_T17/blob/master/Revisi_Soal1.sh
  #### Penyelesaian :
  ```bash
  echo "10 Produk profit terkecil: "
  awk -F '\t' 'NR > 1{if(( $11=="Illinois" || $11=="Texas" ) && $13=="Central" ){SUM[$17] +=$21}} END{for (j in SUM) print j", " SUM[j] | "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 10
  ```
  * Pada ```echo "10 Produk profit terkecil: "``` akan menampilkan __10 produk profit terkecil__ dari kedua state yang memiliki profit terkecil yang didapatkan pada poin 1B. <br>
  * Untuk mendapatkan 10 produk profit terkecil dari kedua state yang juga memiliki profit terkecil, maka kita menggunakan command ```awk``` untuk menyaring data tertentu dari suatu file. <br>
   Command ```-F``` digunakan sebagai, _field separator_ , mengontrol cara __awk__ dalam memberikan suatu pemisah antar kalimat dari catatan input. <br>
  Pemisah yang digunakan adalah __tab__ yang merupakan fungsi dari command ```'\t'```. <br>
  Command ```NR > 1``` digunakan untuk menyimpan jumlah _record_ yang dibaca mulai dari kolom kedua dikarenakan kolom pertama merupakan header dari setiap kolom.  <br>
  Sebelum mengetahui kolom mana saja yang dibaca, kita perlu mengetahui hasil dari poin __1B__ dimana  __2 state yang memiliki profit terkecil__ adalah __Texas__ dan __Illinois__ maka dengan adanya ```{if(( $11=="Illinois" || $11=="Texas" )``` menandakan bahwa program hanya akan mengeksekusi dua kolom dari kedua state tersebut yaitu kolom __product__ dan kolom __profit__. <br>
  #### Output untuk 1A, B dan C :
  ![Output_Soal1ABC](https://user-images.githubusercontent.com/49342639/75592811-e07b9f80-5ab5-11ea-9294-29d60e951c80.jpg)
