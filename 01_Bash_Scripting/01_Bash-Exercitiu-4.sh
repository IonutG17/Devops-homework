#!/bin/bash
# Exercițiul 4:
# Scriptul citește variabile din config.txt și le exportă în environment.
# Formatul fiecărei linii: NUME:valoare
# Exemplu: DB_USER:admindb

CONFIG_FILE="config.txt"

if [ ! -f "$CONFIG_FILE" ]; then
    echo "Fisier config.txt nu exista."
    exit 1
fi

while IFS=":" read -r key value; do
    if [ -z "$key" ]; then
        continue
    fi

    if [ -z "${!key}" ]; then
        export "$key=$value"
        echo "Setat $key"
    else
        echo "$key este deja setat. Se sare."
    fi
done < "$CONFIG_FILE"