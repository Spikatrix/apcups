# APC UPS Monitoring

This is a docker based APC UPS monitoring system that I've deployed on my Raspberry Pi. It also auto-restarts when the power is back after a black out.

## Prerequisites

Install and run `apcupsd`:

```sh
sudo apt install apcupsd
sed -i 's/^NISIP 127.0.0.1/NISIP 0.0.0.0/' /etc/apcupsd/apcupsd.conf
systemctl enable apcupsd
systemctl start apcupsd
apcaccess # Ensure that you can see metrics without errors 
```

## Installation

```sh
docker compose up -d
```
