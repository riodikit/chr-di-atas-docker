#!/bin/bash

# Buat volume Docker (jika belum ada)
docker volume create chr-data

# Bangun image Docker
docker build -t chr7 .

# Jalankan container dengan semua port yang dipetakan
docker run -d --name chr7 --restart unless-stopped \
    -v chr-data:/chr \
    -p 100-25566:100-25566 \
    chr7

echo "MikroTik CHR telah dijalankan di Docker."
