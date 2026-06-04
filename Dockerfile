FROM golang:1.25-alpine AS builder

WORKDIR /src

COPY server.go .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o static-server server.go

FROM scratch

WORKDIR /app

COPY --from=builder /src/static-server /static-server
COPY app/ /app/

EXPOSE 8080

ENTRYPOINT ["/static-server"]
