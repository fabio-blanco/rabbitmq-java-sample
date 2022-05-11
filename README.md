 # RabbitMQ Java Sample: Hello World
 
This project is a simple sample implementation of a message based application system
using RabbitMQ as the message broker.

The system is constituted by two simple applications, a consumer and a producer. And both 
applications communicate by using a RabbitMQ message queue.

This sample code is based on the [official RabbitMQ Hello World tutorial](https://www.rabbitmq.com/tutorials/tutorial-one-java.html).

## How to run the sample

In order to execute the app it is required to have [docker](https://docs.docker.com/engine/install/) 
and [docker compose](https://docs.docker.com/compose/install/) installed. 

Run the app by executing this command on a linux terminal from inside the project directory:
```shell
COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker compose up --build
```

This will start both RabbitMQ container and the application container with the consumer
app running.

Now from another terminal run this in order to open a bash shell inside the application
container:
```shell
docker exec -it rabbit_basic_sample /bin/bash
```

Then just call the producer app to send a message:
```shell
./gradlew -q run -p producer
```

You can see the message, printed by the consumer, on the first terminal.

The RabbitMQ manager front end can be accessed by opening this address on your browser `http://localhos:15672`.
Use the default user and password to login `guest` and `guest`.

# License

Released under [MIT Lisense](https://github.com/fabio-blanco/rabbitmq-java-sample/blob/main/LICENSE).
