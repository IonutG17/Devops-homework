#!/bin/bash
# Exercițiul 1 - Bonus:
# Scriptul așteaptă maxim 1 minut după un fișier.
# Dacă fișierul apare mai devreme, iese imediat cu succes.
# Dacă nu apare în 60 secunde, iese cu eroare.

FILE_TO_WAIT_FOR="fisier_asteptat.txt"
TIMEOUT=60
SECONDS_PASSED=0

echo "[INFO] Aștept maxim $TIMEOUT secunde după fișierul '$FILE_TO_WAIT_FOR'..."

while [[ $SECONDS_PASSED -lt $TIMEOUT ]]; do
    if [[ -f "$FILE_TO_WAIT_FOR" ]]; then
        echo "[SUCCESS] Fișierul '$FILE_TO_WAIT_FOR' a fost creat!"
        exit 0
    fi
    sleep 1
    ((SECONDS_PASSED++))
done

echo "[ERROR] Timeout: Fișierul '$FILE_TO_WAIT_FOR' nu a fost creat în $TIMEOUT secunde."
exit 1
