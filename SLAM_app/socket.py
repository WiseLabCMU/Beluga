import socket
import sys

# Plase change the IP address and port based on the number shown on the app
IP_ADDRESS = '192.168.1.16'
PORT = 8080 
LENGTH = 100

# Create a TCP/IP socket
sock = socket.create_connection((IP_ADDRESS, PORT))
   
while True:
    data = sock.recv(LENGTH)
    print('received "%s"' % data)

