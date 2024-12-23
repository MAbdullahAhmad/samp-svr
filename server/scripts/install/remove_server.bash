#!/bin/bash

# 
# Remove Server
# 

ROOT=$(realpath "$(dirname ${BASH_SOURCE[0]})/../..")
cd $ROOT

# Remove previous installation (if exists)
rm -rf ./samp03