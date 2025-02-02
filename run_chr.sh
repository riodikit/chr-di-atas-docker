#!/bin/bash

# Buat volume Docker (jika belum ada)
docker volume create chr-data

# Bangun image Docker
docker build -t chr7 .

# Jalankan container dengan semua port yang dipetakan
docker run -d --name chr7 --restart unless-stopped \
    -v chr-data:/chr \
    -p 8291:8291 \
    -p 808:80 \
    -p 443:443 \
    -p 2222:22 \
    -p 531:53/tcp \
    -p 531:53/udp \
    -p 123:123/udp \
    -p 8728:8728 \
    -p 8729:8729 \
    -p 2210:2210 \
    -p 179:179 \
    -p 8292:8292 \
    -p 1723:1723 \
    -p 1234:1234 \
    -p 8081:8081 \
    -p 9391:9391 \
    -p 2832:2832 \
    -p 2132:2132 \
    -p 8752:8752 \
    -p 3819:3819 \
    -p 4752:4752 \
    -p 4828:4828 \
    -p 3851:3851 \
    -p 9662:9662 \
    -p 1194:1194/udp \
    -p 1701:1701/udp \
    -p 500:500/udp \
    -p 4500:4500/udp \
    -p 1812:1812/udp \
    -p 23:23 \
    -p 21:21 \
    chr7

echo "MikroTik CHR telah dijalankan di Docker."
