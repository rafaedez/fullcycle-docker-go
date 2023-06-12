FROM golang:1.13.8 as builder
WORKDIR /usr/src/app
COPY *.go ./
RUN GOOS=linux GOARCH=amd64 go build -v -o /usr/local/bin/app ./...
ENTRYPOINT ["/usr/local/bin/app"]

FROM alpine
COPY --from=builder /usr/local/bin/app /usr/local/bin/app
ENTRYPOINT ["/usr/local/bin/app"]
