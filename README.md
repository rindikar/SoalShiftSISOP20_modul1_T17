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
    Setelah data penyortingan kedua kolom didapatkan yakni kolom __state__ dan kolom __jumlah profit per state__, proses dilanjutkan dengan ```head -n 2``` yaitu menampilkan isi dua baris awal dari kedua kolom dalam data penyortingan tersebut. <br>
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
  Sebelum mengetahui kolom mana saja yang dibaca, kita perlu mengetahui hasil dari poin __1B__ dimana  __2 state yang memiliki profit terkecil__ adalah __Texas__ dan __Illinois__ maka dengan adanya ```{if(( $11=="Illinois" || $11=="Texas" )``` menandakan bahwa program hanya akan mengeksekusi dua kolom dari kedua state dan ```&& $13=="Central" )```region __Central__ (kolom ke-13). <br>
   Kedua kolom tersebut disimpan dalam ```{SUM[$17] +=$21}}``` __variabel SUM__ yang akan terdiri dari kolom __product__ (kolom ke-17) dan __jumlah profit per product__ (kolom ke-21). <br>
   Setelah proses ```awk``` selesai, maka command ```END{for (j in SUM) print j, SUM[j]}``` dieksekusi agar dalam program tercatat semua __product__ disertai dengan __jumlah profit per product__.  Hal ini menjadikan catatan input terdiri atas dua kolom yaitu kolom pertama diisi dengan  __product__ dan kolom kedua diisi dengan __jumlah profit per product__. <br>
   Setelah penyaringan data __product__ dan __jumlah profit per product__ telah didapatkan, proses dilanjutkan dengan ```sort -t ',' -g -k2``` penyortingan atau pengurutan data __product__ dengan disertai pemisah ```-t ','``` berdasarkan ```k2``` __jumlah profit per product__ (kolom kedua dari catatan input) sesuai dengan ```-g``` _generic number_ . <br>
   ```Sample-Superstore.tsv``` menunjukkan bahwa proses ```awk``` dieksekusi untuk data yang ada di dalam file bernama _Sample-Superstore.tsv_. <br>
    Setelah data penyortingan kedua kolom didapatkan yakni kolom __product__ dan kolom __jumlah profit per product__, proses dilanjutkan dengan ```head -n 10``` yaitu menampilkan isi 10 baris awal dari kedua kolom dalam data penyortingan tersebut. Hal ini menjadikan program berhasil mendapatkan 10 product apa saja yang memiliki profit terkecil dari kedua state yang juga memiliki profit terkecil. <br>
  #### Output untuk 1A, B dan C :
  ![Output_Soal1ABC](https://user-images.githubusercontent.com/49342639/75592811-e07b9f80-5ab5-11ea-9294-29d60e951c80.jpg)
  
### Soal 2
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar idetersebut cepat diselesaikan. Idenya adalah :
* #### Soal 2A
  Kalian membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka!
  #### Code : https://github.com/rindikar/SoalShiftSISOP20_modul1_T17/blob/master/Revisi_Soal2.sh
  #### Penyelesaian :
  ```bash
   password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1)

   echo $password
  ```
  * Pertama-tama, kita membuat file yang akan menyimpan susunan password sesuai dengan ketentuan yang telah ada. Disini kami membuat file bernama ```password```. <br>
  Command ```cat /dev/urandom``` digunakan untuk menerima data, baik berupa karakter maupun bilangan, random setiap saat. <br>
  Data yang telah diterima secara random tersebut dilakukan penyeleksian dengan command ```tr -dc 'a-zA-Z0-9'``` yaitu menghapus berbagai jenis karakter kecuali ```a-z``` huruf kecil, ```A-Z``` huruf besar dan ```0-9``` bilangan. <br>
  Hingga proses ini, catatan input password sangat banyak. Oleh karena itu, setiap baris dibatasi dengan 28 karakter, sehingga dengan command ```fold -w 28``` menjadikan setiap 28 karakter baru akan selalu terbuat dalam baris baru. <br>
  Kita tidak memakai semua password dalam baris pertama hingga terakhir, namun kita hanya mengambil baris pertama saja. Maka, command ```head -n 1``` akan mengambil password yang telah terbuat dalam baris pertama catatan input. <br>
  Setelah proses pembuatan password selesai, program akan menjalankan command ```echo $password``` untuk menampilkan password yang telah terpilih melalui serangkaian proses pembuatan password yang telah dijelaskan di atas. <br>
   #### Output untuk 2A :
   ![Revisi_Soal2A](https://user-images.githubusercontent.com/49342639/75603787-5c9cd400-5b04-11ea-982c-5aabca2d5370.png)
   
* #### Soal 2B :
  Password acak tersebut disimpan pada file berekstensi __.txt___ dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet!
* #### Soal 2C :
  Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan dienkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.
* #### Soal 2D :
  Membuat dekripsinya supaya nama file bisa kembali.

### Soal 3
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing.
* #### Soal 3A
  Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari __https://loremflickr.com/320/240/cat__ menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log".
  #### Code : https://github.com/rindikar/SoalShiftSISOP20_modul1_T17/blob/master/Revisi_Soal3.sh
  #### Penyelesaian :
  ```bash
  tes=`ls | grep "pdkt_kusuma_" | cut -d "_" -f 3 | sort -n | tail -1`
  echo $tes

  if [[ $tes < 1 ]]
  then
  tes=0
  fi

  a=`expr $tes + 1`
  b=`expr $tes + 29`

  for ((i=a;i<b;i=i+1))
  do
  wget -a wget.log -O "pdkt_kusuma_$i" https://loremflickr.com/320/240/cat
  done
  ```
  * Awalnya, kita perlu mempunyai suatu command yang bertujuan untuk membuat daftar informasi tentang file dan direktori dalam sistem file. Command untuk menjalankan perintah tersebut adalah command ```ls``` yang kami gunakan pada _code_. 
