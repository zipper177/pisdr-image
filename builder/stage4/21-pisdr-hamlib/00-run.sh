#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "Hamlib" ]; then
    git clone https://github.com/Hamlib/Hamlib.git
fi

cd Hamlib
./bootstrap
./configure --with-python-binding
make -j$(nproc)
ldconfig
EOF