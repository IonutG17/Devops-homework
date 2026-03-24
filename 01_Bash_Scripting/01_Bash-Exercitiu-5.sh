#!/bin/bash
# Exercițiul 5:
# Scriptul face backup la un fișier primit prin variabila de mediu BACKUP_FILE_PATH.
# Backup-ul se face doar dacă fișierul a fost modificat (sha256sum).
# Directorul de backup este BACKUP_DIR (implicit "backup").
# Dacă există deja un backup cu același conținut, doar îl redenumim cu timestamp nou.

# Validare variabilă BACKUP_FILE_PATH
if [[ -z "$BACKUP_FILE_PATH" ]]; then
    echo "[ERROR] Variabila de mediu BACKUP_FILE_PATH nu este setată."
    exit 1
fi

# Verificăm existența fișierului
if [[ ! -f "$BACKUP_FILE_PATH" ]]; then
    echo "[ERROR] Fișierul '$BACKUP_FILE_PATH' nu există."
    exit 2
fi

# Directorul de backup (implicit "backup")
BACKUP_DIR="${BACKUP_DIR:-backup}"

# Creăm directorul dacă nu există
mkdir -p "$BACKUP_DIR"

# Hash-ul fișierului original
ORIGINAL_HASH=$(sha256sum "$BACKUP_FILE_PATH" | awk '{print $1}')

echo "[INFO] Hash fișier original: $ORIGINAL_HASH"

# Căutăm dacă există deja un backup cu același hash
EXISTING_BACKUP=$(grep -rl "$ORIGINAL_HASH" "$BACKUP_DIR" 2>/dev/null)

TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
BASENAME=$(basename "$BACKUP_FILE_PATH")
BACKUP_FILE="$BACKUP_DIR/${BASENAME}_$TIMESTAMP"

if [[ -n "$EXISTING_BACKUP" ]]; then
    echo "[INFO] Există deja un backup cu același conținut:"
    echo "       $EXISTING_BACKUP"
    echo "[INFO] Îl redenumesc cu timestamp nou..."

    mv "$EXISTING_BACKUP" "$BACKUP_FILE"
    echo "[SUCCESS] Backup redenumit: $BACKUP_FILE"
    exit 0
fi

# Dacă nu există backup identic → facem unul nou
cp "$BACKUP_FILE_PATH" "$BACKUP_FILE"

echo "[SUCCESS] Backup creat: $BACKUP_FILE"
exit 0
