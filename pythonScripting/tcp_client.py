import socket

TARGET_PORT=9988
TARGET_HOST='localhost'

client=socket.socket(socket.AF_INET, socket.SOCK_STREAM)

client.connect((TARGET_HOST,TARGET_PORT))

client.send(b"ABCD")

response=client.recv(4096)

print(response.decode())
client.close()

