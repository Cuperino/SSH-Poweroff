#!/bin/bash
# sshpoweroff - SSH & Poweroff
# Description: Establish SSH connections to a range of IPs and power off the computers.
# 
# To the extent possible under law, Javier O. Cordero Pérez has waived all copyright and related or neighboring rights to LogMeOut. This work is published from: Puerto Rico.
# 
# This is free and unencumbered software released into the public domain.
# 
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
# 
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
# 
# For more information, please refer to <http://unlicense.org/>

PNAME="SSH & Poweroff"
PVER="1.0"
echo "'$PNAME' by Javier O. Cordero Pérez <javier@imaginary.tech>
version $PVER

To the extent possible under law, Javier O. Cordero Pérez has waived all copyright and related or neighboring rights to 'SSH & Poweroff'. This work is published from: Puerto Rico.
"
# Parse positional arguments
START=$1
if [ "$START" == "" ]
	then START=200
fi

END=$2
if [ "$END" == "" ]
	then END=216
fi

PASSWORD=$3
if [ "$PASSWORD" == "" ]
	then PASSWORD="raspberry"
fi

HOST_BASE=$4
if [ "$HOST_BASE" == "" ]
	then HOST_BASE="192.168.1."
fi
# For each IP address in range
for ((i = $START; i <= $END; i++));
do
	echo "connection #$i"
	HOST="$HOST_BASE$i"
	echo "$HOST"
	# SSH into the computer and power it off.
	sshpass -p "$PASSWORD" ssh pi@"$HOST" 'echo "$PASSWORD" | sudo -S poweroff'
done
