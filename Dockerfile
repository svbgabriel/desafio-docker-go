FROM golang:latest AS builder
WORKDIR /work
COPY main.go .
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" main.go

FROM scratch
COPY --from=builder /work/main .
CMD ["/main"]