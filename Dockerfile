FROM golang:alpine3.15 as builder
WORKDIR /go/src
COPY ./src .
RUN go mod init example/hello
RUN go build -o bin/hello

FROM hello-world:latest
WORKDIR /
COPY --from=builder /go/src/bin/hello .
ENTRYPOINT ["./hello"]