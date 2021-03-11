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
RUN cmake .. -DTESTDATADIR=/src/poppler/poppler-test \
             -DCMAKE_INSTALL_PREFIX=/usr \
    && make \
    && make install

ENTRYPOINT [ "pdftotext" ]
