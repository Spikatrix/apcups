FROM golang:1.23.4 AS builder
WORKDIR /build
RUN git clone https://github.com/mdlayher/apcupsd_exporter.git
WORKDIR /build/apcupsd_exporter/cmd/apcupsd_exporter
RUN CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -o apcupsd_exporter

FROM alpine:3.21.0
COPY --from=builder /build/apcupsd_exporter/cmd/apcupsd_exporter/apcupsd_exporter /usr/local/bin/
RUN chmod +x /usr/local/bin/apcupsd_exporter

EXPOSE 9162
ENTRYPOINT [ "/usr/local/bin/apcupsd_exporter" ]