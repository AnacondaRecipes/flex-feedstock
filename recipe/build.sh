#!/bin/bash

# skip the creation of man pages by faking existance of help2man
if [ `uname` == Darwin ]; then
    export HELP2MAN=/usr/bin/true
fi
if [ `uname` == Linux ]; then
    export HELP2MAN=/bin/true
    export CFLAGS="-g -O2 -D_GNU_SOURCE $CFLAGS"
fi
if [[ ${HOST} =~ .*linux.* ]]; then
    export CC=${GCC}
    # TODO :: Handle cross-compilation properly here
    export CC_FOR_BUILD=${GCC}
fi
./configure --prefix="$PREFIX"  \
            --host=${HOST}      \
            --build=${BUILD}
make -j${CPU_COUNT} ${VERBOSE_AT}
# CXX restart fails?
# make check
make install
