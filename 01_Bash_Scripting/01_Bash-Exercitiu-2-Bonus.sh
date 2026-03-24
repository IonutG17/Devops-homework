#!/bin/bash
# Exercițiul 2 - Bonus:
# Scriptul compară o listă de fișiere (oricâte).
# Dacă toate fișierele sunt identice -> succes.
# Dacă oricare două sunt diferite -> eroare.

if [[ $# -lt 2 ]]; then
    echo "[ERROR] Trebuie să furnizați cel puțin două fișiere."
    exit 2
fi

# Verificăm existența fișierelor
for FILE in "$@"; do
    if [[ ! -f "$FILE" ]]; then
        echo "[ERROR] Fișierul '$FILE' nu există."
        exit 3
    fi
done

# Calculăm hash-ul primului fișier
REFERENCE_HASH=$(sha256sum "$1" | awk '{print $1}')
echo "[INFO] Hash de referință ($1): $REFERENCE_HASH"

# Comparăm restul fișierelor
for FILE in "$@"; do
    CURRENT_HASH=$(sha256sum "$FILE" | awk '{print $1}')
    echo "[INFO] Verific $FILE -> $CURRENT_HASH"

    if [[ "$CURRENT_HASH" != "$REFERENCE_HASH" ]]; then
        echo "[ERROR] Fișierul '$FILE' diferă de fișierul de referință."
        exit 1
    fi
done

echo "[SUCCESS] Toate fișierele sunt identice."
exit 0
