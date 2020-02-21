#!/bin/bash

echo "Region profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$13] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2 | awk 'FNR < 2{print$1}'

echo "2 State profit terkecil: "
awk -F'\t' 'FNR > 1{SUM[$11] +=$21} END{for (j in SUM) print j, SUM[j]}' Sample-Superstore.tsv | sort -gk2  | awk 'FNR < 3{printf"%s \n", $1$2$3$4$5$6}'

echo "10 Produk profit terkecil: "
