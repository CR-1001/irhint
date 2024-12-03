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
./query_irhint.exec -o A -m 10                   -r 10 $dfile $qfile       &>> output_eclog
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
./query_tif.exec    -o SLICING -p 250           -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_10%-100%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 250           -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_1%-10%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 250           -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_0.1%-1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 250           -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

qfile="${dfile}_10K_elems3-extent0.1%-elemid[select_less-than-0.1%].qry"

./query_tif.exec    -o HINTB -m 10              -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTG -m 5               -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o HINTSLICING -m 5 -p 50   -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SHARDING -i 200 -x 2     -r 10 $dfile $qfile       &>> output_wikipedia
./query_tif.exec    -o SLICING -p 250           -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o A -m 9                   -r 10 $dfile $qfile       &>> output_wikipedia
./query_irhint.exec -o B -m 10                  -r 10 $dfile $qfile       &>> output_wikipedia

