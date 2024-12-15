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
./setup-dashboard.sh 21119
echo "GRAFANA_USER=<YOUR-USERNAME>" >> .env
echo "GRAFANA_PASSWORD=<YOUR-PASSWORD>" >> .env
docker compose up -d
```

Visit `https://<ip_or_domain>:3000` and navigate to the APC UPS Dashboard to see metrics.
