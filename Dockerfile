FROM golang:1.13.1-alpine

ENV GOPROXY=https://goproxy.io

RUN sed -i "s|http://dl-cdn.alpinelinux.org|https://mirrors.aliyun.com|g" /etc/apk/repositories && \
    apk add -U tzdata make protobuf git

RUN GIT_TAG="v1.3.2" && \
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $GIT_TAG && \
    go install github.com/golang/protobuf/protoc-gen-go

RUN go get github.com/micro/protoc-gen-micro
