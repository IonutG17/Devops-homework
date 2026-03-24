#!/bin/bash
# Exercițiul 7:
# Scriptul afișează toți userii dintr-un grup, separați prin spațiu.
# Primește un argument obligatoriu: numele grupului.

if [[ $# -ne 1 ]]; then
    echo "[ERROR] Trebuie să furnizați EXACT un argument: numele grupului."
    echo "Usage: $0 <grup>"
    exit 2
fi

GROUP="$1"

# Verificăm dacă grupul există
if ! getent group "$GROUP" >/dev/null; then
    echo "[ERROR] Grupul '$GROUP' nu există."
    exit 3
fi

# Extragem userii din grup
USERS=$(getent group "$GROUP" | awk -F':' '{print $4}' | tr ',' ' ')

# Dacă nu sunt useri, nu afișăm nimic
if [[ -z "$USERS" ]]; then
    exit 0
fi

echo "$USERS"
exit 0
