"""
Python Exercise 7
You want to monitor the response time of a website to check whether the server is responding quickly. The script will send HTTP requests every 2 seconds and will display the response time in milliseconds.

Write a function that receives a URL as a parameter and returns the page’s response time (how long it takes to receive a response).
○ Use the time library for this.

Add another function that receives two parameters (a URL and a number of repetitions):
○ The function will perform a number of calls to the URL in a for or while loop and will store the response times in a list (using the first function).
○ The function will compute an average and will return a tuple with 3 values in the following order: (min, average, max).
○ Run the function several times with a few URLs and display the results.
"""

import requests                                         # pentru a face cereri HTTP
import time                                             # pentru a măsura timpul

# Functie care calculeaza timpul de raspuns al unui URL
def timp_raspuns(url):
    start = time.time()                                 # salvam momentul de inceput
    requests.get(url)                                   # trimitem request catre site
    end = time.time()                                   # salvam momentul de final

    durata = (end - start) * 1000                       # diferenta in milisecunde
    return durata


# Functie care face mai multe teste si calculeaza statistici
def statistici(url, repetari):
    timpi = []                                          # lista in care salvam toate timpurile

    # rulam de mai multe ori request-ul
    for i in range(repetari):
        t = timp_raspuns(url)                           # apelam functia de mai sus
        timpi.append(t)                                 # adaugam timpul in lista

    # calculam statistici
    minim = round (min(timpi), 3)                       # cel mai mic timp, rotunjite la 3 zecimale
    maxim = round (max(timpi), 3)                       # cel mai mare timp
    medie = round (sum(timpi) / len(timpi), 3)          # media

    # returnam un tuple (3 valori)
    return (minim, medie, maxim)


# rulare program
url = "https://python.org"

rezultat = statistici(url, 5)

print("Rezultate (ms):")
print("Min:", rezultat[0])
print("Medie:", rezultat[1])
print("Max:", rezultat[2])