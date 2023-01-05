FROM ubuntu:latest
WORKDIR /keystore/breaker/
RUN apt update -y
RUN apt install python3 -y
RUN apt install vim -y
