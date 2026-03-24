#!/bin/bash
# Exercițiul 11:
# Scriptul face log rotation la un fișier de loguri primit ca argument.
# La fiecare N secunde (primite ca argument):
#   - Copiază logul într-un fișier cu timestamp
#   - Golește fișierul original
#   - Arhivează fișierul rotit (gzip)

if [[ $# -ne 2 ]]; then
    echo "[ERROR] Trebuie să furnizați EXACT două argumente:"
    echo "Usage: $0 <fisier_log> <interval_secunde>"
    exit 2
fi

LOG_FILE="$1"
INTERVAL="$2"

# Validări
if [[ ! -f "$LOG_FILE" ]]; then
    echo "[ERROR] Fișierul de log '$LOG_FILE' nu există."
    exit 3
fi

if ! [[ "$INTERVAL" =~ ^[0-9]+$ ]]; then
    echo "[ERROR] Intervalul trebuie să fie un număr."
    exit 4
fi

echo "[INFO] Pornesc log rotation pentru: $LOG_FILE"
echo "[INFO] Interval rotație: $INTERVAL secunde"

while true; do
    sleep "$INTERVAL"

    TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
    ROTATED_FILE="${LOG_FILE}_${TIMESTAMP}"

    echo "[INFO] Fac log rotation..."
    echo "[INFO] Creez backup: $ROTATED_FILE"

    # Copiem logul
    cp "$LOG_FILE" "$ROTATED_FILE"

    # Golim logul original
    : > "$LOG_FILE"

    # Arhivăm backup-ul
    gzip "$ROTATED_FILE"

    echo "[SUCCESS] Log rotit și arhivat: ${ROTATED_FILE}.gz"
done
