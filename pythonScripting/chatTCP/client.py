import socket
import threading

def receive_messages(client_socket):
    while True:
        try:
            message = client_socket.recv(1024).decode('utf-8')
            if not message:
                break
            print(f"Server: {message}")
        except Exception as e:
            print(f"Error: {e}")
            break

def start_client():
    client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client.connect(('127.0.0.1', 12345))
    
    receive_thread = threading.Thread(target=receive_messages, args=(client,))
    receive_thread.start()
    
    while True:
        message = input("You: ")
        client.send(message.encode('utf-8'))

if __name__ == "__main__":
    start_client()
