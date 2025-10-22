#!/bin/bash

# Archivo a copiar
ARCHIVO="copia.txt"

# Lista de IPs de la red local (puedes editar según tu red)
IPS=("10.10.11.45")

# Usuario con acceso SSH en las máquinas remotas
USUARIO="salas"

# Carpeta destino en las máquinas remotas
DESTINO="/home/$USUARIO/AlvaradoScript"

# Contraseña (solo si no usas clave SSH)
# Nota: se recomienda configurar clave SSH para no usar contraseña en texto plano
CONTRASENA="x"

for IP in "${IPS[@]}"; do
    echo "Copiando $ARCHIVO a $USUARIO@$IP:$DESTINO"
    
    # Usando sshpass para pasar la contraseña (debes instalar sshpass)
    #sshpass -p "$CONTRASENA" scp "$ARCHIVO" "$USUARIO@$IP:$DESTINO"
    sshpass -p "$CONTRASENA" scp -o StrictHostKeyChecking=no "$ARCHIVO" "$USUARIO@$IP:$DESTINO"

    
    if [ $? -eq 0 ]; then
        echo "Copia a $IP exitosa."
    else
        echo "Error copiando a $IP."
    fi
done

echo "Proceso completado."
