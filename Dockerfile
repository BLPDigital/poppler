FROM ubuntu:latest

RUN apt-get update \
    && DEBIAN_FRONTEND="noninteractive" apt-get install -y --no-install-recommends \
    cmake \
    gpp \
    make \
    g++ \
    pkg-config \
    libfreetype6-dev \
    libfontconfig-dev \
    libnss3-dev \
    libopenjp2-7-dev \
    libtiff5-dev \
    libjpeg-dev \
    libboost-all-dev \
    && rm -rf /var/lib/apt/lists/*

COPY . /src/poppler
WORKDIR /src/poppler/build
RUN cmake ..  -DCMAKE_BUILD_TYPE=Release \
              -DCMAKE_INSTALL_PREFIX=/usr \
              -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
              -DBUILD_GTK_TESTS=OFF \
              -DBUILD_QT5_TESTS=OFF \
              -DBUILD_QT6_TESTS=OFF \
              -DBUILD_CPP_TESTS=OFF \
              -DBUILD_SHARED_LIBS=ON \
              -DENABLE_CPP=ON \
              -DENABLE_GLIB=OFF \
              -DENABLE_GOBJECT_INTROSPECTION=OFF \
              -DENABLE_GTK_DOC=OFF \
              -DENABLE_QT5=OFF \
    && make \
    && make install

ENTRYPOINT [ "pdftotext" ]
