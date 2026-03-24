#!/bin/bash
# Exercițiul 6:
# Scriptul face backup periodic (la fiecare X secunde) pentru un director.
# Frecvența este dată de variabila de mediu FRECVENTA_BACKUP (implicit 5 secunde).
# Se face backup doar pentru fișierele modificate (sha256sum).
# Fiecare backup are timestamp și este pus în subdirectorul "backup".

if [[ $# -ne 1 ]]; then
    echo "[ERROR] Trebuie să furnizați directorul de monitorizat."
    echo "Usage: $0 <director>"
    exit 2
fi

TARGET_DIR="$1"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "[ERROR] Directorul '$TARGET_DIR' nu există."
    exit 3
fi

FRECVENTA_BACKUP="${FRECVENTA_BACKUP:-5}"
BACKUP_DIR="$TARGET_DIR/backup"

echo "[INFO] Director monitorizat: $TARGET_DIR"
echo "[INFO] Frecvență backup: $FRECVENTA_BACKUP secunde"
echo "[INFO] Director backup: $BACKUP_DIR"

mkdir -p "$BACKUP_DIR"

declare -A LAST_HASHES

# Funcție pentru calcul hash
calc_hash() {
    sha256sum "$1" | awk '{print $1}'
}

while true; do
    echo "[INFO] Pornesc scanarea pentru modificări..."

    # Iterăm prin toate fișierele din director (doar fișiere, nu directoare)
    while IFS= read -r -d '' FILE; do
        RELATIVE_PATH="${FILE#$TARGET_DIR/}"  # eliminăm prefixul directorului
        CURRENT_HASH=$(calc_hash "$FILE")

        # Dacă fișierul nu a mai fost văzut sau hash-ul s-a schimbat
        if [[ "${LAST_HASHES[$RELATIVE_PATH]}" != "$CURRENT_HASH" ]]; then
            TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
            BACKUP_PATH="$BACKUP_DIR/${RELATIVE_PATH}_$TIMESTAMP"

            echo "[INFO] Fișier modificat: $RELATIVE_PATH"
            echo "[INFO] Creez backup: $BACKUP_PATH"

            cp "$FILE" "$BACKUP_PATH"
            LAST_HASHES[$RELATIVE_PATH]="$CURRENT_HASH"
        fi

    done < <(find "$TARGET_DIR" -type f ! -path "$BACKUP_DIR/*" -print0)

    echo "[INFO] Aștept $FRECVENTA_BACKUP secunde..."
    sleep "$FRECVENTA_BACKUP"
done
