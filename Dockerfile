FROM hashicorp/terraform

ENV TF_VERSION=0.11.14-mesosphere
ENV TF_DOCS_VERSION=0.6.0

RUN apk add --update --no-cache openjdk8-jre
RUN wget https://github.com/fatz/terraform/releases/download/v${TF_VERSION}/linux_amd64.zip -O ./temp.zip && unzip -o ./temp.zip -d /bin/ && rm -f ./temp.zip
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v${TF_DOCS_VERSION}/terraform-docs-v${TF_DOCS_VERSION}-linux-amd64 -O /usr/bin/terraform-docs;chmod +x /usr/bin/terraform-docs
