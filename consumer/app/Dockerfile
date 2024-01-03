FROM python:3.11.4

WORKDIR /usr/src/app

COPY . .

# Installing pika as it is used in the consumer.app
RUN pip install --no-cache-dir pika

# Run the app
CMD ["python", "./consumer.py"]
