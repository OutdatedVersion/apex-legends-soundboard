FROM golang:1.13.4 AS build

WORKDIR /build
COPY server.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o server .

WORKDIR /audio
COPY hash.sh .
COPY ./legend ./legend
RUN bash hash.sh

FROM scratch

COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /build/server /
COPY --from=build /audio/public /public

EXPOSE 2000

ENTRYPOINT ["/server"]