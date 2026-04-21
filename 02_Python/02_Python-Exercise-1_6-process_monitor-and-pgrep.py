"""
Python Exercise 6
1. Continuously monitor a process using a while loop
2. Use the 'pgrep' command (via subprocess) to check if the process is running
3. If the process is not found, restart it
4. Print a warning message every time the process is restarted
5. The process name is stored in a variable at the top of the script
6. Hints:
- process_name = “my-script.sh” 
- process_check = subprocess.run(["pgrep", "-f", process_name], capture_output=True, text=True) 
- if process_check.returncode != 0:...
"""


import subprocess                                                                       # We need this to be able to work and monitor with the subprocess
import time                                                                             # For the time delay between checks

process_name = "02_Python-Exercise-1_6-my_scrypt_to_monitor.sh"

while True:

    process_check = subprocess.run(                                                     # Run the 'pgrep' command to search for the process by name
        ["pgrep", "-f", process_name],                                                  # -f means it searches the full command line, not just the process name
        capture_output=True,                                                            # capture_output=True captures stdout and stderr instead of printing them
        text=True)                                                                      # text=True ensures the output is returned as a string (not bytes)

    print (process_check.returncode)                                                    # Checking the process returncode
    
    if (process_check.returncode != 0):

        print("Process not found, restarting...")
        subprocess.Popen(["./02_Python-Exercise-1_6-my_scrypt_to_monitor.sh"])          # Start the process again using Popen (non-blocking)

    else:
        print("Process is running")
        
    time.sleep(10)                                                                      # Pause the script for 10 seconds before the next check to avoid high CPU usage
