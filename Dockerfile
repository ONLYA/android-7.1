FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y openjdk-8-jdk software-properties-common git-core gnupg flex bison gperf build-essential \
    zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 \
    lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache \
    libgl1-mesa-dev libxml2-utils xsltproc unzip mtools u-boot-tools \
    htop iotop sysstat iftop pigz bc device-tree-compiler lunzip \
    dosfstools

RUN add-apt-repository universe && apt update && \
    apt install python3.9

RUN ln -s /usr/bin/python3.9 /usr/local/bin/python

RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo && \
    chmod +x /usr/local/bin/repo

RUN curl -L https://github.com/aktau/github-release/releases/download/v0.6.2/linux-amd64-github-release.tar.bz2 | tar -C /tmp -jx && \
    mv /tmp/bin/linux/amd64/github-release /usr/local/bin/

RUN which repo && \
    which github-release

COPY build.sh /root/
RUN chmod +x /root/build.sh

COPY init-repo-android7.sh /root/
RUN chmod +x /root/init-repo-android7.sh

COPY fixedDefaultManifestsAndroid7.xml /root/

COPY fixedLibcedarcConfig.mk /root/

COPY Jenkinsfile /root/
