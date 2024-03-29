import pika,time,base64

#Base64 encoded password
encoded_pw="QWRlc3NvMTIz"

decoded_pw = base64.b64decode(encoded_pw).decode('utf-8')

credentials = pika.PlainCredentials('admin',decoded_pw)
connection = pika.BlockingConnection(pika.ConnectionParameters('rabbitmq-dev.default.svc.cluster.local',credentials=credentials))
channel= connection.channel()

#message to be published
message='ibrahim test message'

#Creating the exchange and specifying the exchange type as direct.
channel.exchange_declare(
        exchange='excdefault',
        exchange_type='direct',
        durable=True
)

# publishing the message. since we have a single queue, using routing_key is optional
# it will publish a message endlessly each in 3 seconds intervals
while 1:
    time.sleep(3)
    print("=> Sending: ", message)
    channel.basic_publish(
        exchange='excdefault',
        routing_key='devops',
        body=message
    )

# Close the connection
connection.close()
