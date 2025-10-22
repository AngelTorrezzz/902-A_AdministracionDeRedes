#!/bin/bash

# Obtener IP local y red
IP_LOCAL=$(ip addr show | grep 'inet ' | grep -v 127.0.0.1 | awk '{print $2}' | head -n1)
RED=$(echo "$IP_LOCAL" | cut -d/ -f1 | cut -d. -f1-3)

echo "IP Local: $IP_LOCAL"
echo "Buscando dispositivos en la red $RED.0/24 ..."

# Escanear red usando ping (alternativa ligera)
for i in $(seq 1 254); do
    ping -c 1 -W 1 "$RED.$i" > /dev/null && echo "Host activo: $RED.$i" &
done
wait
