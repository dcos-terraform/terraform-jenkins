FROM hashicorp/terraform

RUN apk add --update --no-cache openjdk8-jre
RUN wget https://github.com/segmentio/terraform-docs/releases/download/v0.4.0/terraform-docs-v0.4.0-linux-amd64 -O /usr/bin/terraform-docs;chmod +x /usr/bin/terraform-docs
