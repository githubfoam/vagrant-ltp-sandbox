#!/usr/bin/env bash

set -o errexit
# set -o pipefail #Illegal option -o pipefail
set -o nounset
set -o xtrace
# set -euo pipefail

echo "=================LTP -Linux Test Project ========================================="

#https://github.com/linux-test-project/ltp

# Export language settings
export LANG=C
export LC_ALL=C

# WORKING_DIR="$HOME/src/ltp"
WORKING_DIR="/tmp/src/ltp"

PREFIX="/opt/ltp"

GIT_URL="https://github.com/linux-test-project/ltp.git"

MAKE_JOBS=$(getconf _NPROCESSORS_ONLN)


BUILD_LOG_FILE="build-log.txt"
INSTALL_LOG_FILE="install-log.txt"

current_time=$(date "+%Y.%m.%d-%H.%M.%S")
# log_file="sysinfo_$current_time.log"  
All_TESTCASES_FILE="all-testcases-log-$current_time.txt"

#requirements
apt-get update -y 
apt-get install build-essential \
    autoconf automake autotools-dev m4 \
    git libaio-dev libattr1-dev libcap-dev \
    linux-headers-$(uname -r) \
    gcc pkgconf bison flex libc6-dev -y
   

# apt-get install git \ 
#     linux-headers-$(uname -r)

# Working directory
mkdir -p $WORKING_DIR
cd $WORKING_DIR

# from git source
git clone https://github.com/linux-test-project/ltp.git
cd ltp

make autotools
./configure --prefix=$PREFIX


# building LTP
make -j$MAKE_JOBS 2>&1 | tee ../$BUILD_LOG_FILE

# install LTP
make install 2>&1 | tee ../$INSTALL_LOG_FILE

echo "================= list of testcases in the runtest directory======================================"
ls  $PREFIX/runtest

# echo "================= run a particular test suite======================================"
# cd $WORKING_DIR/ltp/testcases/kernel/syscalls/fork/
# PATH=$PATH:$PWD ./fork01


# echo "=================  run all the test suites======================================"
# ./runltp

# echo "===================================================================================="
