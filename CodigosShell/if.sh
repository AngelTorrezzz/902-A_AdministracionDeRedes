#!/bin/bash

echo -n "Cual es tu nombre: "
read nombre_usuario
if [ -n "$nombre_usuario" ]; then
	echo "Hola $nombre_usuario!"
	exit 0
else
	echo "No diste tu nombre"
	exit 1
fi

