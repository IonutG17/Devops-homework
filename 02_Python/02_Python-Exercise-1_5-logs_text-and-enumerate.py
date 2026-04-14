"""
Python Exercise 1_5
1. Read the file logs.txt line by line using a for loop
2. The text file contains: 
        INFO: Server started successfully. 
        WARNING: Disk space low. 
        ERROR: Unable to connect to database. 
        INFO: Scheduled backup completed. 
        ERROR: Failed to send email.
3. Check whether each line contains the word 'ERROR'
4. If it does, print the line together with its line number
"""

line_number = 1

with open('02_Python-Exercise-1_5-logs.txt', 'r') as file:                                         
    for line in file:

        if 'ERROR' in line:
            print(f"{line.strip()} -> on line {line_number}")

        line_number += 1
        

"""
Ok, so researching the internet I found out there is a special function called enumerate() that helps for 
exactly these kind of cases.

Basic examples for enumerate():

a = ["Python", "Java", "C++"]
for i, v in enumerate(a):               # the index starts from 0 by default, but it can be changed, see next example
    print(i, v)

Output:                                 
0 Python
1 Java
2 C++

or

a = ["red", "green", "blue"]
for i, v in enumerate(a, 1):            # by specifing (a, 1) in the function we tell him the starting point is 1 (it can be whatever)
    print(i, v)

Output:
1 red
2 green
3 blue

"""


"""   
# Below the code using enumerate(), is more simple and clean:

with open('02_Python-Exercise-1_5-logs.txt', 'r') as file:                                         

    for index, line in enumerate(file, 1):
        if 'ERROR' in line:
            print(f"On line {index} -> {line}")

""" 