#!/usr/bin/env python3

import shlex
import subprocess
from subprocess import Popen, PIPE
import time

#--- set both commands (connect / disconnect) below
connect_command = "~/.screenlayout/xrandr_huawei_plus_hp_config.sh"
disconnect_command = "echo display disconected"
#---

def get_connected_display_count(): 
    process = Popen(shlex.split("xrandr"), stdout=PIPE)
    (output, err) = process.communicate()
    exit_code = process.wait()
    out_string = output.decode("utf-8")
    connected_counter = 0
    for word in out_string.split(' '):
        if word == "connected":
            connected_counter+=1
    return connected_counter

# - to count the occurrenc of " connected "
def count_screens(xr): return xr.count(" connected ")
# - to run the connect / disconnect command(s)
def run_command(cmd): subprocess.Popen(["/bin/bash", "-c", cmd])

# first count
display_count_on_startup = 0
previous_display_count = 0

while True:
    time.sleep(5)
    if(display_count_on_startup == 0):
        display_count_on_startup = get_connected_display_count()
        previous_display_count = display_count_on_startup
        if(display_count_on_startup > 1):
            run_command(connect_command)
    else:
        display_count =  get_connected_display_count()
        if(display_count != previous_display_count):
            previous_display_count = display_count
            run_command(connect_command)
