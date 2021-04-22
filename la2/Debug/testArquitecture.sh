#!/bin/bash

#in order to use this script you must clean all the couts in the la1 program except the average test and train final errors.
#Mode offline, error = Cross Entropy, output fuction softmax

files=("divorce" "nomnist");

rm testArquitecture.csv;
echo "Dataset, Nº iterations, Layers, Nº neurons, eta, mu, Validation Ratio, Decrement Factor, ,Average test error, Average train error, CCR Test, CCR Train" >> testArquitecture.csv

for (( n = 0; n < 2; n++ )); do
  for l in 1 2
   do
    for h in 2 4 8 16 32 64
     do
      echo "${files[n]} ,500, $l, $h, 0.7, 1, 0.0, 1, , $(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[n]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[n]}.dat -i 1000 -l $l -h $h -e 0.7 -m 1 -v 0.0 -d 1 -s -f 1)" >> testArquitecture.csv;
    done
  done
done
