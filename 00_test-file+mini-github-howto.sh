
Just testing the repo, the local connection and if everyting is fine.

-------------------------------------

Later Edit:
Lista si exemple comenzi Git folosite in terminal in VSCode, ptr a lucra cu/in GitHub:

---------------------------------------------------------------------------------------------------
# In momentul in care ai deja creat un repo in GitHub, iei linkul si il "aduci" pe local in VScode:

git clone https://github.com/ITSchool-DevOps-Academy/Teme-curs_Guruian-Ionut

(Dupa care trebuie sa si intri in folderul respectiv, in terminalul din VSCode, ptr ca ti s a creat pe local, exact cu numele repo-ului)

---------------------------------------------------------------------------------------------------
# Introducere fisier in GitHub. Se presupune ca ai creat deja fisierul si vrei sa il urci:

git add nume-fisier.txt                         # orice nume are fisierul si extensia acestuia
git commit -m "Mesaj ce apare la commit"        # mesajul va fi vizibil in GitHub in dreptul fisierului
git push

---------------------------------------------------------------------------------------------------
# Introducere fisiere multiple in GitHub. Se presupune ca ai creat deja fisierele si vrei sa le urci pe toate simultan:

git add .                                       # nu mai trebuie specificat numele fiserului / fiserelor. se pune "." si le ia pe toate.
git commit -m "Mesaj ce apare la commit"        # mesajul va fi vizibil in GitHub in dreptul tuturor fisierelor urcate la acest pas.
git push

---------------------------------------------------------------------------------------------------
# Create new branch, daca se vrea a se modifica ceva existent de exemplu:

git checkout -b nume_branch_nou                 # se va crea branch-ul nou si se va si comuta pe el (nu vei mai fi in main)
git branch                                      # comanda doar de verificare, va aprea in terminal branch-ul pe care esti.

---------------------------------------------------------------------------------------------------
# Merge branch, de exemplu dupa modificari de fisiere si verificare, se vor merge-ui branch-urile cu cel initial:

git checkout main                               # se va comuta pe branch-ul principal, cel main
git merge nume_branch_nou                       # se vor "uni" cele doua
git push

---------------------------------------------------------------------------------------------------
# Pull command. Usually first thing developers might do when they start working, do "download" and update their
# local folder with the latest modifications from GitHub. Modificari facute fie direct in GitHub fie de un alt developer.

git pull

---------------------------------------------------------------------------------------------------

# Other examples and notes

-------------------------------------
# Typical developer workflow:

~Start work~
   ↓
git pull
   ↓
~Make changes~
   ↓
git add
git commit
   ↓
git push

-------------------------------------
# Comanda cu care se poate verifica statusul repo-ului, inainte de a se face de ex un "git pull"

git status                                      

-------------------------------------
# To check if you have git installed on the pc and what version it is

git --version                                   

-------------------------------------
# To connect VSCode to GitHub and configure Git (first time use only)

# Open VSCode

 → Click the Accounts icon (bottom left)

 → Click → Sign in to GitHub

 → A browser will open → authorize VS Code.

# VSCode is now connected to GitHub.

# Now, to configure it, open a new Terminal in VSCode and:

git config --global user.name "Your Name"               # In quotes provide your GitHub username and email adress.
git config --global user.email "your@email.com"