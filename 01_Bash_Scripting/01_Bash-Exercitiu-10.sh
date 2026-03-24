#!/bin/bash
# Exercitiul 10:
# Scriptul adauga ~/bin-itschools in PATH daca directorul exista
# si configurează incarcarea automata la fiecare login.

TARGET_DIR="$HOME/bin-itschools"
BASHRC="$HOME/.bashrc"

# Creeaza directorul daca nu exista
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "[INFO] Creez directorul $TARGET_DIR..."
    mkdir -p "$TARGET_DIR"
fi

# Verificam daca PATH-ul este deja configurat
if grep -q "bin-itschools" "$BASHRC"; then
    echo "[INFO] Directorul este deja in PATH."
else
    echo "[INFO] Adaug directorul in PATH..."
    echo '' >> "$BASHRC"
    echo '# Adauga bin-itschools in PATH daca exista' >> "$BASHRC"
    echo 'if [[ -d "$HOME/bin-itschools" ]]; then' >> "$BASHRC"
    echo '    PATH="$HOME/bin-itschools:$PATH"' >> "$BASHRC"
    echo 'fi' >> "$BASHRC"
fi

echo "[SUCCESS] Configurarea a fost finalizata."
echo "[INFO] Poti rula 'source ~/.bashrc' pentru a aplica modificarile."
