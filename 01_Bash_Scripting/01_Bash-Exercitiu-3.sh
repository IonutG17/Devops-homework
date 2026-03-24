#!/bin/bash
# Exercițiul 3:
# Scriptul verifică dacă un site este disponibil (status code 200-399).
# Primește două argumente: URL-ul si numarul de incercari
# Dacă site-ul răspunde cu un status code valid, scriptul iese cu succes.
# Dacă nu, după numărul maxim de încercări, iese cu eroare.

if [[ $# -ne 2 ]]; then
    echo "[ERROR] Trebuie să furnizați EXACT două argumente:"
    echo "Usage: $0 <URL> <numar_maxim_incercari>"
    exit 2
fi

URL="$1"
MAX_TRIES="$2"

# Validare număr
if ! [[ "$MAX_TRIES" =~ ^[0-9]+$ ]]; then
    echo "[ERROR] Al doilea argument trebuie să fie un număr."
    exit 3
fi

echo "[INFO] Verific disponibilitatea site-ului: $URL"
echo "[INFO] Număr maxim de încercări: $MAX_TRIES"

TRY=1

while [[ $TRY -le $MAX_TRIES ]]; do
    echo "[INFO] Încercarea $TRY..."

    STATUS_CODE=$(curl -o /dev/null -s -w "%{http_code}" "$URL")

    echo "[INFO] Status code primit: $STATUS_CODE"

    if [[ $STATUS_CODE -ge 200 && $STATUS_CODE -le 399 ]]; then
        echo "[SUCCESS] Site-ul este disponibil!"
        exit 0
    fi

    ((TRY++))
    sleep 1
done

echo "[ERROR] Site-ul NU a devenit disponibil după $MAX_TRIES încercări."
exit 1 