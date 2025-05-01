#!/bin/bash

# Buat volume Docker (jika belum ada)
docker volume create chr-data

# Bangun image Docker
docker build -t chr7 .

# Jalankan container dengan semua port yang dipetakan
docker run -d --name chr7 --restart unless-stopped \
  -v chr-data:/chr \
  -p 80:80 \
  -p 443:443 \
  -p 22:22 \
  -p 8080:8080 \
  -p 25565:25565 \
  -p 19132:19132/udp \
  -p 19133:19133/udp \
  -p 9000:9000 \
  -p 1001:1001 \
  -p 1002:1002 \
  -p 1003:1003 \
  -p 1004:1004 \
  -p 1005:1005 \
  -p 1006:1006 \
  -p 1007:1007 \
  -p 1008:1008 \
  -p 1009:1009 \
  -p 1010:1010 \
  -p 1011:1011 \
  -p 1012:1012 \
  -p 1013:1013 \
  -p 1014:1014 \
  -p 1015:1015 \
  -p 1016:1016 \
  -p 1017:1017 \
  -p 1018:1018 \
  -p 1019:1019 \
  -p 1020:1020 \
  -p 1021:1021 \
  -p 1022:1022 \
  -p 1023:1023 \
  -p 1024:1024 \
  -p 1025:1025 \
  -p 1026:1026 \
  -p 1027:1027 \
  -p 1028:1028 \
  -p 1029:1029 \
  -p 1030:1030 \
  chr7


echo "MikroTik CHR telah dijalankan di Docker."
