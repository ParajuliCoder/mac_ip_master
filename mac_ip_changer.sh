#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (sudo)."
   exit 1
fi

INTERFACE="eth0"
generate_mac() {
    printf '02:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256))
}

generate_ip() {
    echo "192.168.$((RANDOM % 254 + 1)).$((RANDOM % 254 + 1))"
}

echo "Starting network identity rotation on $INTERFACE..."

while true; do
    NEW_MAC=$(generate_mac)
    NEW_IP=$(generate_ip)
    ip link set "$INTERFACE" down
    ip link set "$INTERFACE" address "$NEW_MAC"
    ip addr flush dev "$INTERFACE"
    ip addr add "$NEW_IP/24" dev "$INTERFACE"
    ip link set "$INTERFACE" up

    echo "[+] Identity changed | MAC: $NEW_MAC | IP: $NEW_IP"

    sleep 2
done