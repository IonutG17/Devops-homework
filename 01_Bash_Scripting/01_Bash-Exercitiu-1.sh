#!/bin/bash
# Exercițiul 1:
# Scriptul așteaptă la nesfârșit până când un fișier apare pe disk.
# După ce fișierul este creat, scriptul afișează un mesaj și iese cu succes.

FILE_TO_WAIT_FOR="fisier_asteptat.txt"

echo "[INFO] Aștept după fișierul '$FILE_TO_WAIT_FOR' să fie creat..."

while true; do
    if [[ -f "$FILE_TO_WAIT_FOR" ]]; then
        echo "[SUCCESS] Fișierul '$FILE_TO_WAIT_FOR' a fost creat!"
        exit 0
    fi
    sleep 1
done
