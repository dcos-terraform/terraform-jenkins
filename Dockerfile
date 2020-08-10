FROM hashicorp/terraform

ENV TF_VERSION=0.11.14-mesosphere
ENV TF_DOCS_VERSION=0.6.0
ENV TFENV_VERSION=2.0.0

RUN rm /bin/terraform
RUN apk add --update --no-cache openjdk8-jre bash
# RUN mkdir /tfenv && wget https://github.com/tfutils/tfenv/archive/v${TFENV_VERSION}.tar.gz -O ./tfenv.tar.gz && tar -C /tfenv/ -xzf ./tfenv.tar.gz && ln -s /tfenv/bin/* /bin
RUN mkdir /tfenv && wget https://github.com/fatz/tfenv/archive/fatz/miscexec.tar.gz -O ./tfenv.tar.gz && tar -C /tmp/ -xzf ./tfenv.tar.gz && mv /tmp/tfenv*/* /tfenv && ln -s /tfenv/bin/* /bin
RUN mkdir -p /tfenv/versions/0.11.14-mesosphere && wget https://github.com/fatz/terraform/releases/download/v0.11.14-mesosphere/linux_amd64.zip -O ./temp.zip && unzip -o ./temp.zip -d /tfenv/versions/0.11.14-mesosphere
RUN mkdir -p /tfenv/versions/0.12.25-mesosphere && wget https://github.com/fatz/terraform/releases/download/0.12.25-mesosphere/linux_amd64.zip -O ./temp.zip && unzip -o ./temp.zip -d /tfenv/versions/0.12.25-mesosphere

RUN wget https://github.com/segmentio/terraform-docs/releases/download/v0.6.0/terraform-docs-v0.6.0-linux-amd64 -O /tfenv/versions/0.11.14-mesosphere/terraform-docs;chmod +x /tfenv/versions/0.11.14-mesosphere/terraform-docs
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v0.9.1/terraform-docs-v0.9.1-linux-amd64 -O /tfenv/versions/0.12.25-mesosphere/terraform-docs;chmod +x /tfenv/versions/0.12.25-mesosphere/terraform-docs

RUN ln -s /bin/tfenv-miscexec /bin/terraform-docs

RUN tfenv use 0.11.14-mesosphere
