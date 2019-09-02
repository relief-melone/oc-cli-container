FROM ubuntu:latest

LABEL maintainer=relief.melone@gmail.com
LABEL description="Based on Ubuntu with a little more tools like yq to process yaml files"

ENV OC_VERSION "v3.9.0"
ENV OC_RELEASE "openshift-origin-client-tools-v3.9.0-191fece-linux-64bit"

# Install Client Tools
ADD https://github.com/openshift/origin/releases/download/$OC_VERSION/$OC_RELEASE.tar.gz /opt/oc/release.tar.gz
RUN tar --strip-components=1 -xzvf  /opt/oc/release.tar.gz -C /opt/oc/ && \
  mv /opt/oc/oc /usr/bin/ && \
  rm -rf /opt/oc

# Install yq
RUN add-apt-repository ppa:rmescandon/yq && \
  apt update && \
  apt install yq -y

EXPOSE 8001

