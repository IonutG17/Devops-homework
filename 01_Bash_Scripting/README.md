📌 Bash Exercises
Colecție completă de scripturi Bash pentru cele 13 exerciții din cursul IT School.


📁 Structura proiectului
exercitiul1/   → Așteaptă apariția unui fișier
exercitiul2/   → Compararea fișierelor (2 fișiere / listă de fișiere)
exercitiul3/   → Verificarea disponibilității unui site (status code)
exercitiul4/   → Încărcarea variabilelor din config.txt în environment
exercitiul5/   → Backup inteligent pentru un fișier (hash + timestamp)
exercitiul6/   → Backup periodic pentru un director (hash + frecvență)
exercitiul7/   → Listarea userilor dintr-un grup
exercitiul8/   → Copierea userilor între grupuri
exercitiul9/   → Restart automat pentru serviciul sshd
exercitiul10/  → Adăugarea persistentă a unui director în PATH
exercitiul11/  → Log rotation cu arhivare gzip
exercitiul12/  → Adăugarea automată a shebang-ului în fișiere .sh
exercitiul13/  → Implementarea comenzii which


🧠 Descrierea exercițiilor
1. Așteptarea apariției unui fișier
Script care verifică periodic dacă un fișier există. Include timeout opțional.

2. Compararea fișierelor
Varianta simplă: compară două fișiere folosind sha256sum

Varianta avansată: compară oricâte fișiere între ele

3. Verificarea unui site
Face request-uri repetate până când site-ul răspunde cu un status code între 200–399.

4. Încărcarea variabilelor din config.txt
Parsează un fișier de configurare și exportă variabilele în environment.

5. Backup inteligent pentru un fișier
Creează backup doar dacă fișierul s-a modificat (hash). Include timestamp și redenumire inteligentă.

6. Backup periodic pentru un director
Monitorizează un director și face backup doar pentru fișierele modificate.

7. Listarea userilor dintr-un grup
Afișează userii unui grup folosind getent.

8. Copierea userilor între grupuri
Adaugă userii dintr-un grup în altul, evitând duplicările.

9. Restart automat pentru sshd
Verifică dacă serviciul sshd rulează și îl pornește dacă este oprit.

10. Adăugarea unui director în PATH
Configurează persistent PATH-ul pentru a include ~/bin-itschools.

11. Log rotation
Creează backup-uri ale unui fișier de log la intervale regulate și le arhivează.

12. Adăugarea shebang-ului
Detectează fișiere .sh fără shebang și îl inserează automat.

13. Implementarea comenzii which
Parcurge PATH-ul și caută executabile cu numele dat.


📚 Bonusuri implementate
Timeout pentru așteptarea fișierelor

Compararea unei liste de fișiere

Persistența variabilelor de mediu

Backup incremental inteligent

Arhivare automată a logurilor

Detectarea și adăugarea shebang-ului

Implementare completă a comenzii which

Validări și exit codes standardizate


🧩 Bune practici folosite
Mesaje clare: [INFO], [ERROR], [SUCCESS]

Validări pentru argumente și fișiere

Folosirea sha256sum pentru detectarea modificărilor

Folosirea getent pentru compatibilitate LDAP

Folosirea mktemp pentru fișiere temporare sigure

Evitarea buclelor infinite necontrolate

Structură modulară și ușor de navigat


👨‍💻 Autor
IonutG17
Cursant IT School — Bash Scripting
2026