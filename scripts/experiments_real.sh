#!/bin/bash


make -j


echo "--- ECLOG ---"

dfile="samples/eclog/ECOM-LOG.dat"

qfile="${dfile}_10K_elems3-extent0.1%.qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTSLICING -m 5 -p 250  -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SHARDING -i 100 -x 5     -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o A -m 10                  -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_eclog

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_10%-100%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o A -m 10                  -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_eclog

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_1%-10%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o A -m 10                  -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_eclog

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_0.1%-1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o A -m 10                  -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_eclog

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_less-than-0.1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_eclog
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o A -m 10                  -r 10 $dfile $qfile       &>> output_eclog
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_eclog


echo "--- WIKIPEDIA ---"

dfile="samples/wikipedia/WIKIPEDIA-100K+_random-articles-all-revisions_[2020-2024).dat"

qfile="${dfile}_10K_elems3-extent0.1%.qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 250  -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_10%-100%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_1%-10%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_0.1%-1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_less-than-0.1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 50            -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia


echo "--- ECLOG (update) ---"

dfile="samples/eclog/ECOM-LOG.dat"
dfile_bottom90="${dfile}_bottom90%"
dfile_top10="${dfile}_top10%"
lines=$(wc -l < "$dfile")
lines90=$((lines * 90 / 100))
lines10=$((lines - lines90))
head -n $lines10 $dfile > $dfile_top10
tail -n $lines90 $dfile > $dfile_bottom90

./update_tif.exec    -o HINTB -m 10              -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_tif.exec    -o HINTG -m 5               -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_tif.exec    -o HINTSLICING -m 5 -p 50   -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_tif.exec    -o SHARDING -i 200 -x 2     -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_tif.exec    -o SLICING -p 50            -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_irhint.exec -o A -m 10                  -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog
./update_irhint.exec -o B -m 10                  -d 178478  $dfile_bottom90 $dfile_top10     &>> output_eclog


echo "--- WIKIPEDIA (update) ---"

dfile="samples/wikipedia/WIKIPEDIA-100K+_random-articles-all-revisions_[2020-2024).dat"
dfile_bottom90="${dfile}_bottom90%"
dfile_top10="${dfile}_top10%"
lines=$(wc -l < "$dfile")
lines90=$((lines * 90 / 100))
lines10=$((lines - lines90))
head -n $lines10 $dfile > $dfile_top10
tail -n $lines90 $dfile > $dfile_bottom90

./update_tif.exec    -o HINTB -m 10              -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_tif.exec    -o HINTG -m 5               -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_tif.exec    -o HINTSLICING -m 5 -p 50   -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_tif.exec    -o SHARDING -i 200 -x 2     -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_tif.exec    -o SLICING -p 50            -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_irhint.exec -o A -m 9                   -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia
./update_irhint.exec -o B -m 10                  -d 927283  $dfile_bottom90 $dfile_top10     &>> output_wikipedia