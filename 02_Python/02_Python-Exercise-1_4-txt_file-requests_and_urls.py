"""
Python Exercise 1_4
1. Create a file named urls.txt containing one URL per line, example:
https://httpbin.org/status/201
https://httpbin.org/status/400
https://httpbin.org/status/500
https://httpbin.org/status/404
https://httpbin.org/status/201
https://httpbin.org/status/503
https://httpbin.org/status/200
https://httpbin.org/status/303
2. Read the file line by line
3. Use the requests library to perform an HTTP call for each URL
4. If the status code is between 200 and 299, append the URL to success.txt
5. If the status code is between 300 and 599, append the URL to errors.txt
"""

"""
with open('demofile.txt', 'r') as file:                                         # basic syntax for reading a txt file line by line
    for line in file:
        print(line.strip())


response = requests.get("https://api.github.com")                               # basic syntax for using requests.get() and checking a url
print(response.status_code)


with open("demofile.txt", "a") as f:                                            # basic syntax for writing (apending) in a txt file
  f.write("Now the file has more content!")

"""


import requests

with open('02_Python-Exercise-1_4-urls.txt', 'r') as file:
    for line in file:
        print(line.strip())

        response = requests.get(line.strip())
        print(response.status_code)

        if response.status_code in range (200, 300):                            # the range up to 300 so it goes up to 299
            print("Success! Info logged in the Success txt file")
            with open("02_Python-Exercise-1_4-success.txt", "a") as f:
                f.write(line)

        elif response.status_code in range (300, 600):                          # the range up to 600 so it goes up to 599
            print("Error! Info logged in the Error txt file")
            with open("02_Python-Exercise-1_4-error.txt", "a") as f:
                f.write(line)

"""
Note to future self:

Aparently the url "https://httpbin.org/status/303" returns 303 - redirect and thats why the status code is 200 
and it gets placed in the Success txt file. 
Play some more with the requests.get() because there is a paramater there that you can use to either use 
the original status or the redirect status.

Ideas to improve the code in the future:
* play with the requests.get(), there is a paramater there that helps to either use the original status or the redirect status.
* use some try / except for other cases in wich the program will stop (invalid url, site is down etc)
* open the success and error txt files just once to write in them, lets say at the end, and not after each check.

"""