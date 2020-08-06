FROM hashicorp/terraform

ENV TF_VERSION=0.11.14-mesosphere
ENV TF_DOCS_VERSION=0.6.0
ENV TFENV_VERSION=2.0.0

RUN rm /bin/terraform
RUN apk add --update --no-cache openjdk8-jre bash
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v${TF_DOCS_VERSION}/terraform-docs-v${TF_DOCS_VERSION}-linux-amd64 -O /usr/bin/terraform-docs;chmod +x /usr/bin/terraform-docs
RUN mkdir /tfenv && wget https://github.com/tfutils/tfenv/archive/v${TFENV_VERSION}.tar.gz -O ./tfenv.tar.gz && tar -C /tfenv/ -xzf ./tfenv.tar.gz && ln -s /tfenv/tfenv-${TFENV_VERSION}/bin/* /bin
RUN mkdir -p /tfenv/tfenv-${TFENV_VERSION}/versions/0.11.14-mesosphere && wget https://github.com/fatz/terraform/releases/download/v0.11.14-mesosphere/linux_amd64.zip -O ./temp.zip && unzip -o ./temp.zip -d /tfenv/tfenv-${TFENV_VERSION}/versions/0.11.14-mesosphere
RUN mkdir -p /tfenv/tfenv-${TFENV_VERSION}/versions/0.12.25-mesosphere && wget https://github.com/fatz/terraform/releases/download/0.12.25-mesosphere/linux_amd64.zip -O ./temp.zip && unzip -o ./temp.zip -d /tfenv/tfenv-${TFENV_VERSION}/versions/0.12.25-mesosphere
RUN tfenv use 0.11.14-mesosphere
