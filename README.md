# SSH-Poweroff
Establish SSH connections to a range of IPs and power off the computers.

Usage
-------------
```
usage: sshpoweroff [START_IP] [END_IP] [PASSWORD] [HOST_SEGMENT]

positional arguments:
  START_IP              Last numbers from Starting IP (default: 200)
  END_IP                Last numbers from Ending IP (default: 216)
  PASSWORD              Remote computers' password (default: raspberry)
  HOST_SEGMENT          IPs' first three numbers (default: 192.168.1)
```
