import pika,base64

#Base64 encoded password
encoded_pw="QWRlc3NvMTIz"
#decode the password
decoded_pw = base64.b64decode(encoded_pw).decode('utf-8')

credentials = pika.PlainCredentials('admin',decoded_pw)
connection = pika.BlockingConnection(pika.ConnectionParameters('rabbitmq-dev.default.svc.cluster.local',credentials=credentials))
channel = connection.channel()

queue = channel.queue_declare('devops')
queue_name = queue.method.queue

channel.exchange_declare(exchange='excdefault',exchange_type='direct',durable=True)

channel.queue_bind(
    exchange='excdefault',
    queue=queue_name,
    routing_key='devops'
)

def callback(ch, method,properties,body):
    print('=>Receiving:',body)
    payload = body#.decode('utf8')  #json.loads(body.decode('utf8'))
    # print('Message received: {}'.format(payload['message']))
    ch.basic_ack(delivery_tag=method.delivery_tag)

channel.basic_consume(on_message_callback=callback,queue=queue_name)
print(' Waiting for incoming messages..')
channel.start_consuming()