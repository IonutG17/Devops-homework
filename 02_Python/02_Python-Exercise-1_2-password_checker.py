"""
Python Exercise 1_2
1. Read a variable named 'parola' from the user using input()
2. Compare it with an environment variable named PAROLA_SECRETA
3. If they match, print 'Parola corecta'
4. Otherwise, print 'Parola gresita'
5. Run the program multiple times to verify correct behavior
"""



import os                                       # in order to be able to use environment variables we need to import the os

parola = input("Type in your password: ")
PAROLA_SECRETA = os.getenv("PAROLA_SECRETA")    # searching for the env variable given and giving it to our local variable

if parola == PAROLA_SECRETA:
    print("Correct password")
else:
    print("Incorrect password")

# Important, to set the env variable additional work needs to be done (the actual creation of the env variable)
# In the terminal (linux) write "export PAROLA_SECRETA=12345" or whatever password you want.
# Run the script in the terminal with "python3 file_name.py"

#       Note:   the newly created env variable is temporary and will exist only until 
#               we close that session of the terminal

#       Note 2: to create the env variable we wrote in the terminal "export PAROLA_SECRETA=12345"
#               and if we want to delete it we use "unset PAROLA_SECRETA"

#       Note 3: to have the env variable permanent and not lose it when we close the terminal one of the 
#               configuration files must be modified (for example ~/.bashrc or ~/.profile) and use the 
#               "export PAROLA_SECRETA=12345" command in that file.


"""
# BONUS, just for fun.
# Backup search in a local file if environment variable is missing

import os

parola = input("Type in your password: ")

PAROLA_SECRETA = os.getenv("PAROLA_SECRETA")

if PAROLA_SECRETA is None:                                                      # If there is no env variable set
    with open("02_Python-Exercise-1_2-password_checker.txt", "r") as f:         # We read in the txt file for the password
        PAROLA_SECRETA = f.read().strip()                                       # The variable PAROLA_SERETA becomes what we read from the txt file

if parola == PAROLA_SECRETA:
    print("Correct password")
else:
    print("Incorrect password")

"""