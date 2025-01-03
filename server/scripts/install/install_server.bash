#!/bin/bash

# 
# Install Server
# 

ROOT=$(realpath "$(dirname ${BASH_SOURCE[0]})/../..")
cd $ROOT

# Check if installation already exists
if [ -d "./server/samp03" ]; then
  echo "Error: Server is already installed."
  exit 1
fi

# Install Server
tar -xvf ./dist/archives/samp037svr.tar.gz
cp ./configs/1-basic.cfg ./samp03/server.cfg
