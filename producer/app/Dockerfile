FROM python:3.11.4

WORKDIR /usr/src/app

COPY . .

# Installing pika as it is used in the producer.app
RUN pip install --no-cache-dir pika

# Running the app when the container starts
CMD ["python", "./producer.py"]
