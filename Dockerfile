FROM jenkinsci/jnlp-slave

USER root

WORKDIR /opt

# Versions
ENV DOCKER_VERION 1.12.5
ENV DOCKER_COMPOSE_VERSION 1.18.0
ENV HELM_VERSION 2.5.1
ENV KUBECTL_VERSION 1.7.0

# Install docker binaries
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERION}.tgz && \
    tar -zxvf docker-${DOCKER_VERION}.tgz && \
    cp docker/* /usr/bin/ && \
    rm -rf /opt/docker*

# Install docker-compose binary
RUN curl -L https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) -o /usr/bin/docker-compose && \
    chmod +x /usr/bin/docker-compose

# Install kubectl utility
RUN wget https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/bin/

# Install helm for kubernetes
RUN wget https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    tar -zxvf helm-v${HELM_VERSION}-linux-amd64.tar.gz && \
    cp linux-amd64/helm /usr/bin/ && \
    rm -rf /opt/helm*

