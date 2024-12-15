#!/bin/bash

# Check if correct number of arguments is provided
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: $0 <dashboard_id> [prometheus_ds_name]"
    exit 1
fi

DASHBOARD_ID=$1
PROMETHEUS_DS=${2:-prometheus}  # Use second arg if provided, else default to "prometheus"
DOWNLOAD_DIR="grafana/provisioning/dashboards/dashboard-config"

# Download the dashboard JSON file
mkdir -p "$DOWNLOAD_DIR"
curl -sSL "https://grafana.com/api/dashboards/${DASHBOARD_ID}/revisions/latest/download" -o "$DOWNLOAD_DIR/dashboard-${DASHBOARD_ID}.json"

# Replace "DS_PROMETHEUS" with the specified Prometheus datasource UID
sed -i "s/\${DS_PROMETHEUS}/${PROMETHEUS_DS}/g" "$DOWNLOAD_DIR/dashboard-${DASHBOARD_ID}.json"