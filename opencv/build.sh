#!/bin/bash

mkdir build
cd build
# unset CMAKE_OSX_SYSROOT
# unset CMAKE_OSX_DEPLOYMENT_TARGET
# export SDKROOT=/Library/Developer/CommandlineTools
cmake                                                               \
    -DPYTHON_EXECUTABLE=$PREFIX/bin/python                          \
    -DPYTHON_INCLUDE_DIR=$PREFIX/include/python2.7/                 \
    -DPYTHON_LIBRARY=$PREFIX/lib/libpython2.7.dylib                 \
    -DPYTHON_PACKAGES_PATH=$PREFIX/lib/python2.7/site-packages/     \
    -DCMAKE_INSTALL_PREFIX=$PREFIX                                  \
    -DWITH_CUDA=OFF                                                 \
    -DWITH_AVFOUNDATION=OFF                                         \
    -DWITH_FFMPEG=ON                                                \
    -DJPEG_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DJPEG_LIBRARY:FILEPATH=$PREFIX/lib/libjpeg.so                  \
    -DPNG_PNG_INCLUDE_DIR:PATH=$PREFIX/include                      \
    -DPNG_LIBRARY:FILEPATH=$PREFIX/lib/libpng.so                    \
    -DZLIB_INCLUDE_DIR:PATH=$PREFIX/include                         \
    -DZLIB_LIBRARY:FILEPATH=$PREFIX/lib/libz.so                     \
    -DCMAKE_OSX_ARCHITECTURES="x86_64"                              \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=""                                \
    ..
make
make install
