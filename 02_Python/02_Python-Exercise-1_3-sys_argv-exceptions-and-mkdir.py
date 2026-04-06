"""
Python Exercise 1_3
1. Import the sys library to access command-line arguments
2. Check if two parameters were passed (username and age)
3. If not, raise an exception
4. If parameters exist:
    a. Print how many parameters were passed
    b. If age > 18, create a folder on disk with the username as its name
"""


"""
##################################################
#Example of sys_argv:

Small script just for extra info and understanding sys.argv
First of all, the arguments are values given to your code without using the input function for example, directly when running in the terminal.
So, for example, to run such a script you would write in the terminal "python3 example.py A B C", where:
    * python3 is the language in which to execute the scrypt
    * example.py is the script name (with the extension)
    * A, B and C are the arguments (the ones that you could have used input to give them when running, now directly in the terminal)


import sys
print("Total arguments:", len(sys.argv))
print("Script name:", sys.argv[0])
print("Arguments:", sys.argv[1:])

total = 0
for arg in sys.argv[1:]:
    total += int(arg)

print("Sum =", total)


This script can be run with: python3 02_Python-Exercise-1_3-sys_argv-exceptions-and-mkdir.py 3 5 7
This means that the result will be:
    Total arguments: 4                                                              # The 3 numbers + the filename itself, this is the total length (len) of sys.argv
    Script name: 02_Python-Exercise-1_3-sys_argv-exceptions-and-mkdir.py            # The actual filename (the argument in position sys.argv[0] )
    Arguments: ['3', '5', '7']                                                      # A list of the numbers given as arguments, starting in pos sys.argv[1] and going all the way to the end
    Sum: 15                                                                         # Calculates the sum of the numbers given as arguments

    
##################################################
Examples of raising exceptions:

x = -1
if x < 0:
    raise Exception("Sorry, no numbers below zero")

or

x = "hello"
if not type(x) is int:
  raise TypeError("Only integers are allowed")

  
##################################################
#Example of mkdir (needs os library) combined with exceptions and error handling:

import os

# Specify the directory name
directory_name = "GFG"

# Create the directory
try:
    os.mkdir(directory_name)
    print(f"Directory '{directory_name}' created successfully.")
except FileExistsError:
    print(f"Directory '{directory_name}' already exists.")
except PermissionError:
    print(f"Permission denied: Unable to create '{directory_name}'.")
except Exception as e:
    print(f"An error occurred: {e}")


"""

# Now for the actual exercise:

import sys
import os

total_arguments = len(sys.argv) - 1                                             # We do not consider the filename itself, we need 2 arguments besides that

if total_arguments != 2:
    raise Exception("Not OK, please provide the name and age of the user")      # Checking if the correct number of arguments were provided

name = sys.argv[1]                                                              # We give to the name variable the value of the first argument

try:                                                                            # Checking if the second argument is an integer, as the age should be
    age = int(sys.argv[2])
except ValueError:
    raise Exception("Age must be a number")                                     # If it is not an int it will throw an exception

print(f"2 Arguments successfully given, the name {name} and the age {age}")     # Printing the 2 arguments, after checking everything

if age > 18:
    os.mkdir(name)                                                              # Creating the directory if the age is above 18
    print(f"Directory '{name}' created successfully.")
