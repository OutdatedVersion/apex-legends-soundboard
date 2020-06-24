FROM golang:1.13.4 AS build

WORKDIR /build
COPY main.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /build/server /
COPY public public

EXPOSE 2000

ENTRYPOINT ["/server"]