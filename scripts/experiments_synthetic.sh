#!/bin/bash

dir="samples/synthetic"
runs=10


make -j


echo "--- default ---"

dfile="$dir/default/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_cardinality ---"

dfile="$dir/vary_cardinality/norm_zipf_w128000000_n_dev1000000_a1.2_n100000.txt_terms50_dict10000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_cardinality/norm_zipf_w128000000_n_dev1000000_a1.2_n500000.txt_terms50_dict10000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_cardinality/norm_zipf_w128000000_n_dev1000000_a1.2_n5000000.txt_terms50_dict10000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_cardinality/norm_zipf_w128000000_n_dev1000000_a1.2_n10000000.txt_terms50_dict10000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_description ---"

dfile="$dir/vary_description/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms5_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_description/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms10_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_description/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms100_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_description/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms500_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_deviation ---"

dfile="$dir/vary_deviation/norm_zipf_w128000000_n_dev1000000_a1.01_n1000000.txt_terms100_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_deviation/norm_zipf_w128000000_n_dev1000000_a1.1_n1000000.txt_terms100_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_deviation/norm_zipf_w128000000_n_dev1000000_a1.4_n1000000.txt_terms100_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_deviation/norm_zipf_w128000000_n_dev1000000_a1.8_n1000000.txt_terms100_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_domain ---"

dfile="$dir/vary_domain/norm_zipf_w32000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_domain/norm_zipf_w64000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_domain/norm_zipf_w256000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/vary_domain/norm_zipf_w512000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_qelems ---"

dfile="$dir/vary_qelems/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems1-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems2-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems4-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems5-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_qextent ---"

dfile="$dir/vary_qextent/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.5"
qfile="${dfile}_10K_elems3-extent0.01%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems3-extent0.5%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems3-extent1.0%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

qfile="${dfile}_10K_elems3-extent5.0%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


echo "--- vary_skewness ---"

dfile="$dir/default/norm_zipf_w128000000_n_dev1000000_a1.001_n1000000.txt_terms50_dict100000_skew1.001"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/default/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.25"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/default/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew1.75"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing

dfile="$dir/default/norm_zipf_w128000000_n_dev1000000_a1.2_n1000000.txt_terms50_dict100000_skew2.0"
qfile="${dfile}_10K_elems3-extent0.1%.qry"

 ./query_irhint.exec -o A -m 13                   -r $runs    $dfile $qfile       &>> output_irHINTa
 ./query_irhint.exec -o B -m 15                   -r $runs    $dfile $qfile       &>> output_irHINTb
 ./query_tif.exec    -o SHARDING -i 200 -x 2      -r $runs    $dfile $qfile       &>> output_sharding
 ./query_tif.exec    -o SLICING -p 250            -r $runs    $dfile $qfile       &>> output_slicing
 ./query_tif.exec    -o HINTSLICING -p 250 -m 8   -r $runs    $dfile $qfile       &>> output_hintslicing


make clean
