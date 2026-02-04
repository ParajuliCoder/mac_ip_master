#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (sudo)."
   exit 1
fi

INTERFACE="eth0"

print_logo() {
    echo "=============================================================="
    echo "  _   _      _                      _ _       _             "
    echo " | \\ | | ___| |___      _____  _ __| (_) __ _| |_ ___  _ __ "
    echo " |  \\| |/ _ \\ __\\ \\ /\\ / / _ \\| '__| | |/ _\` | __/ _ \\| '__|"
    echo " | |\\  |  __/ |_ \\ V  V / (_) | |  | | | (_| | || (_) | |   "
    echo " |_| \\_|\\___|\\__| \\_/\\_/ \\___/|_|  |_|_|\\__,_|\\__\\___/|_|   "
    echo "                                                              "
    echo "                 Created by Anish Parajuli"
    echo "=============================================================="
    echo ""
}
generate_mac() {
    printf '02:%02x:%02x:%02x:%02x:%02x' $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256)) $((RANDOM%256))
}

generate_ip() {
    echo "192.168.$((RANDOM % 254 + 1)).$((RANDOM % 254 + 1))"
}
clear
print_logo
echo "[*] Targeted Interface: $INTERFACE"
echo "[*] Rotation Interval: 2 Seconds"
echo "[*] Press Ctrl+C to stop identity rotation"
echo "------------------------------------------------------"

while true; do
    NEW_MAC=$(generate_mac)
    NEW_IP=$(generate_ip)
    ip link set "$INTERFACE" down
    ip link set "$INTERFACE" address "$NEW_MAC"
    ip addr flush dev "$INTERFACE"
    ip addr add "$NEW_IP/24" dev "$INTERFACE"
    ip link set "$INTERFACE" up

    echo "[+] $(date +%T) | Identity Shifted -> [MAC: $NEW_MAC] [IP: $NEW_IP]"

    sleep 2
done
