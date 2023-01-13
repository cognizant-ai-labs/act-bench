#!/bin/bash

# make a datasets directory
mkdir -p datasets

# move into the datasets directory
cd datasets

# download the datasets
wget https://act-bench.s3.us-west-2.amazonaws.com/act-bench-cnn.pkl
wget https://act-bench.s3.us-west-2.amazonaws.com/act-bench-resnet.pkl
wget https://act-bench.s3.us-west-2.amazonaws.com/act-bench-vit.pkl

# move back to the root directory
cd ..
