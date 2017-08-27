#!/bin/bash

# skip the creation of man pages by faking existance of help2man
if [ `uname` == Darwin ]; then
    export HELP2MAN=/usr/bin/true
fi
if [ `uname` == Linux ]; then
    export HELP2MAN=/bin/true
fi
./configure --prefix="$PREFIX" --host=${HOST}
make -j${CPU_COUNT} ${VERBOSE_AT}
# CXX restart fails?
# make check
make install
