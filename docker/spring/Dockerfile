FROM alpine:3.8

LABEL name="alpine-cf-cli" \
      description="Cloud Foundry CLI for building microservices" \
      url="https://cloud.docker.com/swarm/tatsontung/repository/docker/tatsontung/dev/general" \
      maintainer="tatsontung"

# Install all the necessary packages
RUN apk add --update --no-cache curl bash openssl ca-certificates && \
    rm -rf /var/cache/apk/*

# Define CF CLI version
ENV CF_CLI_VERSION 6.37.0

# Install CF CLI
RUN curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&version=${CF_CLI_VERSION}" | tar -zx -C /usr/local/bin
