#!/bin/bash

#in order to use this script you must clean all the couts in the la1 program except the average test and train final errors.
#Mode offline

files=("xor" "divorce" "nomnist");
layers=("1" "1" "1");
neurons=("16" "2" "16");

rm testErrorOutputFunction.csv

echo "Dataset, Nº iterations, Layers, Nº neurons, eta, mu, Validation Ratio, Decrement Factor,Error Function, Output Function, mode, ,Average test error, Average train error, CCR Test, CCR Train" >> testErrorOutputFunction.csv


for (( n = 0; n < 3; n++ )); do
  for e in 0.8 0.7 0.5
    do
    for m in 1 0.9 0.7
      do
        echo "${files[n]} ,500, ${layers[n]}, ${neurons[n]}, $e, $m, 0.0, 1, MSE, Sigmoid , ,$(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[n]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[n]}.dat -i 1000 -l ${layers[n]} -h ${neurons[n]} -e $e -m $m -v 0.0 -d 1)" >> testErrorOutputFunction.csv;
        echo "${files[n]} ,500, ${layers[n]}, ${neurons[n]}, $e, $m, 0.0, 1, MSE, Softmax , ,$(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[n]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[n]}.dat -i 1000 -l ${layers[n]} -h ${neurons[n]} -e $e -m $m -v 0.0 -d 1 -s)" >> testErrorOutputFunction.csv;
        echo "${files[n]} ,500, ${layers[n]}, ${neurons[n]}, $e, $m, 0.0, 1, Cross Entropy, Softmax , ,$(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[n]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[n]}.dat -i 1000 -l ${layers[n]} -h ${neurons[n]} -e $e -m $m -v 0.0 -d 1 -s -f 1)" >> testErrorOutputFunction.csv;
    done
  done
done
