FROM golang:1.13.8 as builder
WORKDIR /usr/src/app
COPY *.go ./
RUN GOOS=linux GOARCH=amd64 go build -v -o app

FROM scratch
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/app app
ENTRYPOINT ["./app"]
