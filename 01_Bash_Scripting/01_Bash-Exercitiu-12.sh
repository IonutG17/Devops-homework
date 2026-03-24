#!/bin/bash
# Exercițiul 12:
# Scriptul verifică toate fișierele .sh dintr-un director primit ca parametru.
# Dacă un fișier nu are shebang, îl adaugă automat la început.

if [[ $# -ne 1 ]]; then
    echo "[ERROR] Trebuie să furnizați EXACT un argument: directorul de scanat."
    echo "Usage: $0 <director>"
    exit 2
fi

TARGET_DIR="$1"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "[ERROR] Directorul '$TARGET_DIR' nu există."
    exit 3
fi

echo "[INFO] Caut fișiere .sh în directorul: $TARGET_DIR"

# Găsim toate fișierele .sh
while IFS= read -r -d '' FILE; do
    echo "[INFO] Verific fișierul: $FILE"

    # Citim prima linie
    FIRST_LINE=$(head -n 1 "$FILE")

    if [[ "$FIRST_LINE" == "#!"* ]]; then
        echo "[INFO] Shebang deja prezent. Sar peste."
        continue
    fi

    echo "[WARNING] Shebang lipsă. Adaug în fișierul: $FILE"

    # Creăm un fișier temporar
    TMP_FILE=$(mktemp)

    # Scriem shebang-ul
    echo "#!/bin/bash" > "$TMP_FILE"

    # Adăugăm conținutul original
    cat "$FILE" >> "$TMP_FILE"

    # Mutăm fișierul temporar peste original
    mv "$TMP_FILE" "$FILE"

    # Asigurăm permisiuni de execuție
    chmod +x "$FILE"

    echo "[SUCCESS] Shebang adăugat în $FILE"
done < <(find "$TARGET_DIR" -type f -name "*.sh" -print0)

echo "[SUCCESS] Verificare completă."
exit 0
