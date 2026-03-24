#!/bin/bash
# Exercițiul 9:
# Scriptul verifică dacă serviciul sshd este pornit.
# Dacă este oprit, îl pornește automat.

SERVICE="sshd"

echo "[INFO] Verific statusul serviciului $SERVICE..."

# Verificăm dacă serviciul rulează
if systemctl is-active --quiet "$SERVICE"; then
    echo "[INFO] Serviciul $SERVICE este deja pornit."
    exit 0
else
    echo "[WARNING] Serviciul $SERVICE este oprit. Încerc să îl pornesc..."
    systemctl start "$SERVICE"

    # Verificăm dacă a pornit cu succes
    if systemctl is-active --quiet "$SERVICE"; then
        echo "[SUCCESS] Serviciul $SERVICE a fost pornit cu succes."
        exit 0
    else
        echo "[ERROR] Nu am reușit să pornesc serviciul $SERVICE."
        exit 1
    fi
fi
