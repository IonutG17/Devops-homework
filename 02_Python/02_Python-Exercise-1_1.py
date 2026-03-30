"""
Python Exercise 1_1
1. Define 8 variables (string, number, boolean, None, list, set, dictionary and tuple)
2. For each one use print to showcase their value and type
3. Create a multi line string variable called documentatie and showcase for each one something like:
    Variable X1 is of type Y1 and its value is Z1
    Variable X2 is of type Y2 and its value is Z2
4. Display this new variable on the console
"""

#1. Variables definition
var_string = 'Ionut'
var_number = 10
var_boolean = True
var_none = None
var_list = ['plums', 'pears', 'apples']
var_set = {1, 2, 2, 3}
var_dict = {
    'Hello': 'Salut',
    'Bye': 'La revedere'
}
var_tuple = (5, 6, 7)

#2. Displaying the variables: value and type
print(var_string, type(var_string))
print(var_number, type(var_number))
print(var_boolean, type(var_boolean))
print(var_none, type(var_none))
print(var_list, type(var_list))
print(var_set, type(var_set))
print(var_dict, type(var_dict))
print(var_tuple, type(var_tuple))

#3. Variable documentatie
documentatie =f"""
Variable var_string is of type {type(var_string)} and its value is {var_string}
Variable var_number is of type {type(var_number)} and its value is {var_number}
Variable var_boolean is of type {type(var_boolean)} and its value is {var_boolean}
Variable var_none is of type {type(var_none)} and its value is {var_none}
Variable var_list is of type {type(var_list)} and its value is {var_list}
Variable var_set is of type {type(var_set)} and its value is {var_set}
Variable var_dict is of type {type(var_dict)} and its value is {var_dict}
Variable var_tuple is of type {type(var_tuple)} and its value is {var_tuple}
"""

#4. Displaying the new variable
print(documentatie)