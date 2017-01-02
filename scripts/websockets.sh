cd $DEPS_HOME/dl
git clone https://github.com/warmcat/libwebsockets.git
cd libwebsockets
git checkout v2.1.0
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$DEPS_HOME ..
make && make install
