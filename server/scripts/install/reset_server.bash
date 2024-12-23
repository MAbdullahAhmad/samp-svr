#!/bin/bash

# 
# Reset Server
# 

ROOT=$(realpath "$(dirname ${BASH_SOURCE[0]})/../..")
cd $ROOT

# Remove previous installation (if exists)
rm -rf ./samp03

# Install Server
tar -xvf ./server/dist/archives/samp037svr.tar.gz