#!/bin/bash

#in order to use this script you must clean all the couts in the la1 program except the average test and train errors.

files=( "divorce" "nomnist");
layers=("1" "1");
neurons=( "2" "16");

rm testVAndF.csv;
echo "Dataset, Nº iterations, Layers, Nº neurons, eta, mu, Validation Ratio, Decrement Factor,Error Function, Output Function, ,Average test error, Average train error, CCR Test, CCR Train, average iter" >> testVAndF.csv;

#first we test the xor apart with F=1 and F=2
echo "xor ,1000, 1, 16, 0.7, 1, 0.0, 1,MSE,softmax, , $(./la2 -t ../../basesDatosPr2IMC/dat/train_xor.dat -T ../../basesDatosPr2IMC/dat/test_xor.dat -i 1000 -l 1 -h 16 -e 0.7 -m 1 -v 0.0 -d 1 -s)" >> testVAndF.csv;
echo "xor ,1000, 1, 16, 0.7, 1, 0.0, 2,MSE,softmax, , $(./la2 -t ../../basesDatosPr2IMC/dat/train_xor.dat -T ../../basesDatosPr2IMC/dat/test_xor.dat -i 1000 -l 1 -h 16 -e 0.7 -m 1 -v 0.0 -d 2 -s)" >> testVAndF.csv;

#then we try the rest with convinations of v and F

for v in 0.0 0.15 0.25
 do
  for F in 1 2
   do
      echo "${files[0]}";
      echo "${files[0]} ,1000, ${layers[0]}, ${neurons[0]}, 0.8, 1, $v, $F,MSE,softmax , $(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[0]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[0]}.dat -i 1000 -l ${layers[0]} -h ${neurons[0]} -e 0.8 -m 1 -v $v -d $F -s)" >> testVAndF.csv;
  done
done

for v in 0.0 0.15 0.25
 do
  for F in 1 2
   do
      echo "${files[1]}";
      echo "${files[1]} ,1000, ${layers[1]}, ${neurons[1]}, 0.7, 1, $v, $F,Cross Entropy,softmax , $(./la2 -t ../../basesDatosPr2IMC/dat/train_${files[1]}.dat -T ../../basesDatosPr2IMC/dat/test_${files[1]}.dat -i 1000 -l ${layers[1]} -h ${neurons[1]} -e 0.7 -m 1 -v $v -d $F -f 1 -s)" >> testVAndF.csv;
  done
done
