import pika, json,uuid

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel= connection.channel()

message = 'Ibrahim test message'
channel.exchange_declare(
        exchange='order',
        exchange_type='direct'
)

# publish the message. since we have a single queue, using routing_key is optional
channel.basic_publish(
    exchange='order',
    routing_key='devops',
    body=message
)
# Print the message on the screen
print(f'A message is sent: {0} ',message)

# Close the connection
connection.close()
