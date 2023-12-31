FROM library/ubuntu:20.04 as UBUNTU_BASE
MAINTAINER alessandri.luca1991@gmail.com
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget \
    && apt-get -y install libblas-dev liblapack-dev \
    && apt-get -y install libatlas-base-dev \
    && apt-get -y install gfortran \
    && apt-get -y install libxml2-dev libxmlsec1-dev \
    && apt-get install -y libbz2-dev \
    && apt-get -y install pkg-config\
    && apt-get update && apt-get install -y --no-install-recommends apt-utils \
    && apt-get -y install libhdf5-dev
RUN apt-get update && apt install -y libudunits2-dev libgdal-dev
COPY p7zip_16.02 /tmp/
RUN apt-get update \
    && apt-get install -y wget \
    && mkdir data \
	&& apt-get -y install build-essential \
	&& cd /tmp/ && make \
	&& make all \
	&& cp ./bin/7za /bin
RUN apt-get update
RUN apt-get install -y liblzma-dev
RUN apt-get update
RUN apt-get install -y sqlite3
RUN apt-get install -y libsqlite3-dev
COPY Python-3.8.6.tgz /tmp/Python-3.8.6.tgz
RUN tar -xzvf /tmp/Python-3.8.6.tgz
RUN cd /Python-3.8.6/ && ./configure --enable-loadable-sqlite-extensions --enable-optimizations
RUN cd /Python-3.8.6/ && make
RUN cd /Python-3.8.6/ && make install
COPY pipdeptree-2.1.0-py3-none-any.whl /tmp/
RUN apt-get update \
    && apt-get install -y git
RUN pip3 install /tmp/pipdeptree-2.1.0-py3-none-any.whl
COPY anaconda /anaconda/
COPY Python3.8.6_toBeInstalled/install_files.7z* /tmp/
RUN cd /tmp/ && 7za -y x "*.7z*"
COPY Python3.8.6_toBeInstalled/listForDockerfile.sh /tmp/
RUN /tmp/listForDockerfile.sh
RUN apt-get update
RUN apt-get update
RUN apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN apt-get update && apt install -y libudunits2-dev libgdal-dev
COPY ./R-4.1.1 /tmp
RUN apt-get update
RUN apt-get -y install gfortran
RUN apt-get -y install build-essential
RUN apt-get -y install fort77
RUN apt-get -y install xorg-dev
RUN apt-get -y install liblzma-dev  libblas-dev gfortran
RUN apt-get -y install gobjc++
RUN apt-get -y install aptitude
RUN apt-get -y install libbz2-dev
RUN apt-get -y install libpcre3-dev
RUN aptitude -y install libreadline-dev
RUN apt-get -y install libcurl4-openssl-dev
RUN apt-get -y install libcairo2-dev
RUN apt-get -y install libxt-dev
COPY pcre2-10.37.tar.gz /tmp/prec/
RUN tar -zxvf /tmp/prec/pcre2-10.37.tar.gz
RUN /pcre2-10.37/configure
RUN make -j 24
RUN make install
RUN chmod +x /tmp/configure
RUN /tmp/configure --with-x=yes --enable-R-shlib
RUN make
RUN make install
COPY p7zip_16.02 /tmp/
RUN cd /tmp/ && make
RUN chmod 777 -R /tmp/
RUN cd /tmp/ && make install
RUN rm -r /tmp/*
RUN apt install -y build-essential libcurl4-gnutls-dev libxml2-dev libssl-dev
RUN apt-get install -y libcurl4-openssl-dev libssl-dev
RUN apt-get install -y wget
RUN apt-get install -y libgit2-dev
COPY R-4.1.1_toBeInstalled/install_files.7z* /tmp/
RUN cd /tmp/ && 7za -y x "*.7z*" 
COPY R-4.1.1_toBeInstalled/listForDockerfile.sh /tmp/
RUN /tmp/listForDockerfile.sh

COPY PtoBeInstalled/install_filesP* /tmp/
RUN cd /tmp/ && 7za -y x "install_filesP.7z*"
COPY PtoBeInstalled/listForDockerfileP.sh /tmp/ 
RUN /tmp/listForDockerfileP.sh 
COPY RtoBeInstalled/install_filesR* /tmp/
RUN cd /tmp/ && 7za -y x "install_filesR.7z*"
COPY RtoBeInstalled/listForDockerfileR.sh /tmp/ 
RUN /tmp/listForDockerfileR.sh 
COPY rscript.R /home/
RUN Rscript /home/rscript.R
COPY Rprofile /root/.Rprofile
ENV SHELL=/bin/bash
COPY scripts /scripts
RUN /scripts/main.sh
CMD ["jupyter", "lab", "--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]

ENV USER=user
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io
COPY ss.sh /ss.sh
RUN /ss.sh
RUN newgrp docker
COPY Riderv2 /home/Riderv2
COPY rider /home/rider
RUN apt-get update && apt install -y default-jdk
