FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install wget dpkg nano sudo -y

RUN adduser --disabled-password --gecos "" test
RUN echo "test:password" | chpasswd
RUN usermod -aG sudo test
COPY user.sh /home/test
COPY root.sh /home/test
RUN chmod -R +x /home/test/user.sh
RUN chmod -R +x /home/test/root.sh

USER test
WORKDIR /home/test
