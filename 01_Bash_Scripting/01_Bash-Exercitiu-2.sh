#!/bin/bash
# Exercițiul 2:
# Scriptul compară două fișiere primite ca argumente folosind sha256sum.
# Dacă fișierele sunt identice -> succes.
# Dacă sunt diferite -> eroare.

if [ "$#" -ne 2 ]; then
    echo "Utilizare: $0 fisier1 fisier2"
    exit 1
fi

for file in "$@"; do
    if [ ! -f "$file" ]; then
        echo "Eroare: $file nu exista."
        exit 2
    fi
done

HASH1=$(sha256sum "$1" | awk '{print $1}')
HASH2=$(sha256sum "$2" | awk '{print $1}')

if [ "$HASH1" = "$HASH2" ]; then
    echo "Fisierele sunt identice."
    exit 0
else
    echo "Fisierele sunt diferite."
    exit 3
fi