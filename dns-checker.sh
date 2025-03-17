#!/bin/bash

# Warna output
red=$(tput setaf 196)
green=$(tput setaf 2)
reset=$(tput sgr0)

# Memastikan IFS hanya menangani newline
IFS=$'\n'

# Header Output
printf "%-20s %-12s %-15s %-20s\n" "Provider" "Type" "IP Address" "AVG TIME"

# Membaca setiap baris dari file dnstest.txt
while IFS=':' read -r PROVIDER TYPE IP; do
    # Trim spasi di awal/akhir
    PROVIDER=$(echo "$PROVIDER" | xargs)
    TYPE=$(echo "$TYPE" | xargs)
    IP=$(echo "$IP" | xargs)

    # Jalankan ping sebanyak 3 kali dengan timeout 1 detik per paket
    PING_RESULT=$(ping -c 3 -W 1 "$IP" 2>/dev/null)

    # Cek apakah ada respons
    if echo "$PING_RESULT" | grep -q "0 received"; then
        printf "%-20s %-12s %-15s %s\n" "$PROVIDER" "$TYPE" "$IP" "${red}TIMEOUT${reset}"
    else
        # Ambil rata-rata waktu respons dari bagian "rtt min/avg/max/mdev"
        AVG_TIME=$(echo "$PING_RESULT" | grep "rtt" | awk -F'/' '{print $5}')
        printf "%-20s %-12s %-15s ${green}%s ms${reset}\n" "$PROVIDER" "$TYPE" "$IP" "$AVG_TIME"
    fi
done < dnstest.txt
