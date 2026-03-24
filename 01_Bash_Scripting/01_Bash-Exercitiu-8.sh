#!/bin/bash
# Exercițiul 8:
# Scriptul copiază userii dintr-un grup în altul.
# Primește 2 parametri obligatorii și diferiți: grupul sursă și grupul destinație.

SRC="$1"
DST="$2"

if [ -z "$SRC" ] || [ -z "$DST" ]; then
    echo "Utilizare: $0 grup_sursa grup_destinatie"
    exit 1
fi

if [ "$SRC" = "$DST" ]; then
    echo "Grupurile trebuie sa fie diferite."
    exit 2
fi

USERS=$(grep "^$SRC:" /etc/group | awk -F':' '{print $4}' | tr ',' ' ')

for user in $USERS; do
    usermod -aG "$DST" "$user"
    echo "Adaugat $user in $DST"
done