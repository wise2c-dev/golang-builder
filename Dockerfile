FROM golang:1.13.2-alpine

RUN apk add -U tzdata make git

RUN apk add protobuf==3.6.1-r1

RUN GIT_TAG="v1.3.2" && \
    go get -d -u github.com/golang/protobuf/protoc-gen-go && \
    git -C "$(go env GOPATH)"/src/github.com/golang/protobuf checkout $GIT_TAG && \
    go install github.com/golang/protobuf/protoc-gen-go

RUN go get github.com/micro/protoc-gen-micro
