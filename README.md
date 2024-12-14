# APC UPS Monitoring

This is a docker based APC UPS monitoring system that I've deployed on my Raspberry Pi. It also auto-restarts when the power is back after a black out.

## Prerequisites

Install and run `apcupsd`:

```sh
sudo apt install apcupsd
systemctl enable apcupsd
systemctl start apcupsd
```

## Installation

```sh
docker compose up -d
```
