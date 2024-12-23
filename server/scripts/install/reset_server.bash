#!/bin/bash

# 
# Reset Server
# 

ROOT=$(realpath "$(dirname ${BASH_SOURCE[0]})/../..")
cd $ROOT

# Remove previous installation (if exists)
rm -rf ./samp03

# Install Server
tar -xvf ./dist/archives/samp037svr.tar.gz
cp ./configs/1-basic.cfg ./samp03/server.cfg