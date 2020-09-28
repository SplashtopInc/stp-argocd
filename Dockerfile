FROM argoproj/argocd:v1.7.6

USER root
RUN apt-get update && \
    apt-get install -y \
        curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER argocd

ARG HELM_S3_PLUGIN_VERSION="0.9.2"
ARG HELM_S3_PLUGIN_REPO="https://github.com/hypnoglow/helm-s3.git"

RUN helm plugin install ${HELM_S3_PLUGIN_REPO} --version ${HELM_S3_PLUGIN_VERSION}

ENV HELM_PLUGINS="/home/argocd/.local/share/helm/plugins/"
ENV AWS_REGION="ap-northeast-1"
