#!/bin/bash

# Archivo a copiar
#ARCHIVO="copia.txt"

if [ls -eq $1]; then
	echo "El archivo: $1 ya existe en el directorio actual"
else 
	echo "El archivo $1 no existe en el directorio actual"
fi

echo "proceso completado."
