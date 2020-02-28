#!/bin/bash

echo "Region profit terkecil: "
awk -F '\t' 'NR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2 {print$1}'

echo "2 State profit terkecil: "
awk -F '\t' 'NR > 1{if( $13=="Central" ){SUM[$11] +=$21}} END{for (j in SUM) print j", " SUM[j] | "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 2
#| sort -k2 
#| awk FNR < 3{print$1$2$3$4$5}'

echo "10 Produk profit terkecil: "
awk -F '\t' 'NR > 1{if(( $11=="Illinois" || $11=="Texas" ) && $13=="Central" ){SUM[$17] +=$21}} END{for (j in SUM) print j", " SUM[j] | "sort -t ',' -g -k2"}' Sample-Superstore.tsv | head -n 10
