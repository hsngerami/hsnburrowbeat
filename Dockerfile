FROM golang:1.9.4-alpine3.7

MAINTAINER gerami <hsn.gerami@gmail.com>

RUN apk add --update \
    bash \
    curl \
    git \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && apk add ca-certificates wget && update-ca-certificates && rm -rf /var/cache/apk/*



ARG BEATS_VERSION=6.2.1

RUN go get github.com/elastic/beats; exit 0
WORKDIR ${GOPATH}/src/github.com/elastic/beats
RUN git branch -a
RUN git checkout tags/v${BEATS_VERSION}
RUN mkdir -p ${GOPATH}/src/github.com/hsngerami/hsnburrowbeat
COPY . ${GOPATH}/src/github.com/hsngerami/hsnburrowbeat/
WORKDIR ${GOPATH}/src/github.com/hsngerami/hsnburrowbeat/
RUN make clean
RUN go version
RUN make setup
RUN make
RUN chmod 777 -R ./
CMD ["./hsnburrowbeat", "-strict.perms=false", "-e", "-d", "\"*\""]
