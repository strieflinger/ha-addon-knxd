#!/usr/bin/with-contenv bashio
set -e

INTERFACE=$(bashio::config 'interface')
DEVICE=$(bashio::config 'device')
ADDRESS=$(bashio::config 'address')
CLIENT_ADDRESS=$(bashio::config 'client_address')
CUSTOM=$(bashio::config 'custom_config')

KNX_INI="
[main]
addr = ${ADDRESS}
client-addrs = ${CLIENT_ADDRESS}
connections = server,interface
logfile = /dev/stdout

[server]
server = ets_router
tunnel = tunnel
discover = true
name = knxd

[interface]
driver = ${INTERFACE}
device = ${DEVICE}
"

if [ "${#CUSTOM}" -ge 5 ]; then
    bashio::log.info "Using custom knxd configuration"
    echo "${CUSTOM}" > /etc/knxd.ini
else
    # Validate device only when not using custom config
    if bashio::var.is_empty "${DEVICE}"; then
        bashio::log.error "No device configured. Set the 'device' option to your KNX interface."
        bashio::log.info "Available serial devices:"
        if ls /dev/serial/by-id/ > /dev/null 2>&1; then
            for dev in /dev/serial/by-id/*; do
                bashio::log.info "  ${dev}"
            done
        else
            bashio::log.info "  (none found)"
        fi
        exit 1
    fi
    bashio::log.info "Starting knxd with interface=${INTERFACE} device=${DEVICE} address=${ADDRESS}"
    echo "${KNX_INI}" > /etc/knxd.ini
fi

bashio::log.info "knxd config:"
cat /etc/knxd.ini

exec knxd /etc/knxd.ini
