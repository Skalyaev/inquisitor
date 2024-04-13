FROM debian:latest

RUN apt-get update -y \
    && apt-get install g++ -y \
    && apt-get install make -y \
    && apt-get install iproute2 -y \
    && apt-get install net-tools -y \
    && apt-get install libpcap-dev -y \
    && apt-get install iputils-ping -y \
    && mkdir /root/inquisitor

WORKDIR /root
COPY include inquisitor/include
COPY src inquisitor/src
COPY Makefile inquisitor/Makefile

WORKDIR /root/inquisitor
RUN make

CMD ["sleep", "infinity"]
