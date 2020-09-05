FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install wget dpkg nano -y

COPY ubuntu-20.04.sh /root
