#!/usr/bin/env bash

set -euo pipefail

# directorio donde está el script (funciona aun si se ejecuta desde otra ubicación)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Encuentra y renombra archivos terminados en .log
find "$SCRIPT_DIR" -type f -name '*.log' -print0 |
while IFS= read -r -d '' file; do
  new="${file%.log}.LOG"

  if [ -e "$new" ]; then
    printf 'AVISO: ya existe el destino, no se renombra:\n  Origen: %s\n  Dest:   %s\n' "$file" "$new" >&2
    continue
  fi

  # mv con -- para proteger nombres que empiezan con -
  if mv -- "$file" "$new"; then
    printf 'Renombrado: %s -> %s\n' "$file" "$new"
  else
    printf 'ERROR al renombrar: %s\n' "$file" >&2
  fi
done
