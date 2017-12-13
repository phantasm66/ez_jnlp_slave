FROM jenkinsci/jnlp-slave

USER root

WORKDIR /opt

# Versions
ENV DOCKER_VERION 1.12.5
ENV HELM_VERSION 2.5.1
ENV KUBECTL_VERSION 1.7.0

# Install docker binaries
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERION}.tgz
RUN tar -zxvf docker-${DOCKER_VERION}.tgz
RUN cp docker/* /usr/bin/
RUN rm -rf /opt/docker*

# Install kubectl utility
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x kubectl
RUN mv kubectl /usr/bin/

# Install helm for kubernetes
RUN wget https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz
RUN cp linux-amd64/helm /usr/bin/
RUN rm -rf /opt/helm*

