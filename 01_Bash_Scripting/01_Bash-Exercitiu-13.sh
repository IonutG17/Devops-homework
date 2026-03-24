#!/bin/bash
# Exercițiul 13:
# Scriptul parsează variabila PATH și caută un executabil cu numele dat.
# Afișează toate căile unde executabilul este găsit.
# Dacă nu este găsit nicăieri, afișează eroare și iese cu cod de eroare.

if [[ $# -ne 1 ]]; then
    echo "[ERROR] Trebuie să furnizați EXACT un argument: numele executabilului."
    echo "Usage: $0 <comanda>"
    exit 2
fi

CMD="$1"

# Spargem PATH în array
IFS=':' read -r -a PATH_DIRS <<< "$PATH"

FOUND=0

echo "[INFO] Caut executabilul '$CMD' în PATH..."

for DIR in "${PATH_DIRS[@]}"; do
    # Construim calea completă
    FILE="$DIR/$CMD"

    # Verificăm dacă fișierul există și este executabil
    if [[ -x "$FILE" ]]; then
        echo "$FILE"
        FOUND=1
    fi
done

if [[ $FOUND -eq 0 ]]; then
    echo "[ERROR] Executabilul '$CMD' nu a fost găsit în PATH."
    exit 1
fi

exit 0
