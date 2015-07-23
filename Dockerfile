# RabbitMQ
#
# VERSION               1.0

FROM rodrigosavian/ubuntu:latest
MAINTAINER Rodrigo Savian <rodrigosavian@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV INITRD No

RUN locale-gen en_US en_US.UTF-8

RUN sed -i '$ a deb http://www.rabbitmq.com/debian/ testing main' /etc/apt/sources.list
RUN wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN apt-key add rabbitmq-signing-key-public.asc
RUN apt-get update
RUN apt-get install rabbitmq-server -y
RUN rabbitmq-server -detached
RUN rabbitmqctl add_user project project
RUN rabbitmqctl set_permissions -p / project '.*' '.*' '.*'

EXPOSE 5672