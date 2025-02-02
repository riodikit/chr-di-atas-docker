# Stage 1: Build the CHR image
FROM ubuntu:22.04 AS builder
RUN apt-get update && apt-get install -y wget unzip qemu-utils
WORKDIR /tmp
RUN wget https://download.mikrotik.com/routeros/7.15.3/chr-7.15.3.img.zip && \
    unzip chr-7.15.3.img.zip && \
    qemu-img convert -f raw -O qcow2 chr-7.15.3.img chr-7.15.3.qcow2

# Stage 2: Final image
FROM ubuntu:22.04
RUN apt-get update && apt-get install -y qemu-user-static qemu-system-x86
COPY --from=builder /tmp/chr-7.15.3.qcow2 /chr-7.15.3.qcow2

# Expose ports
EXPOSE 8291 808 4430 2222 23 21 531 123 8728 8729 2210 179 8292 1723 1234 8081 9391 2832 2132 2928 8752 3819 4752 4828 3851 9662 3892
EXPOSE 1194/udp 531/udp 123/udp 1701/udp 500/udp 4500/udp 1812/udp 1813/udp

# Define command to run the MikroTik CHR image
CMD ["qemu-system-x86_64", "-m", "256M", "-smp", "1", "-hda", "/chr-7.15.3.qcow2", "-nographic", \
     "-nic", "user,hostfwd=tcp::8291-:8291,hostfwd=tcp::808-:80,hostfwd=tcp::4430-:443,hostfwd=tcp::2222-:22,hostfwd=tcp::23-:23,hostfwd=tcp::21-:21,hostfwd=udp::531-:53,hostfwd=tcp::53-:53,hostfwd=udp::123-:123,hostfwd=tcp::8728-:8728,hostfwd=tcp::8729-:8729,hostfwd=tcp::2210-:2210,hostfwd=tcp::179-:179,hostfwd=tcp::8292-:8292,hostfwd=udp::1194-:1194,hostfwd=tcp::1194-:1194,hostfwd=udp::1701-:1701,hostfwd=tcp::1723-:1723,hostfwd=udp::500-:500,hostfwd=udp::4500-:4500,hostfwd=tcp::50-:50,hostfwd=tcp::51-:51,hostfwd=udp::1812-:1812,hostfwd=udp::1813-:1813,hostfwd=tcp::1234-:1234,hostfwd=tcp::8081-:8081,hostfwd=tcp::9391-:9391,hostfwd=tcp::2832-:2832,hostfwd=tcp::2132-:2132,hostfwd=tcp::2928-:2928,hostfwd=tcp::8752-:8752,hostfwd=tcp::3819-:3819,hostfwd=tcp::4752-:4752,hostfwd=tcp::4828-:4828,hostfwd=tcp::3851-:3851,hostfwd=tcp::9662-:9662,hostfwd=tcp::3892-:3892"]
