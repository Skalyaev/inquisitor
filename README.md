# Inquisitor

*ARP Poisoning.*

The so-called OSI model is the architecture followed by computer networks from all over the planet.
It consists of 7 layers, each of which carries risks and is exposed to different types of vulnerabilities and forms of exploitation.
At the network level, there are elements in charge of deciding where to direct the traffic.
Every local network has a default gateway, which receives external traffic and distributes it among its nodes.
This gateway is usually also known as router.
If a network node is able to impersonate the gateway, it can take control of the traffic, intercept it and decide who to forward it to, as well as being able to modify or block it.
ARP spoofing can also be used legitimately, for example to redirect new connections to a registration page before using a network, as is common in networks open doors of airports, cafeterias and other public places.

## Usage
```sh
sudo apt update
sudo apt install git make docker.io
git clone git@github.com:Skalyaeve/inquisitor.git
cd inquisitor
sudo make docker
sudo docker exec -it inquisitor bash
```
```sh
ping -c 1 client
ping -c 1 server
mac1=$(arp -a | grep client | awk '{print $4}')
ip1=$(arp -a | grep client | awk '{print $2}' | sed 's/[()]//g')
mac2=$(arp -a | grep server | awk '{print $4}')
ip2=$(arp -a | grep server | awk '{print $2}' | sed 's/[()]//g')
./Inquisitor -v $mac1 $ip1 $mac2 $ip2
```
> Open new terminals for server and client.
```sh
sudo docker exec -it server bash
```
```sh
arp -a
nc -vlnp 4242
```
```sh
sudo docker exec -it client bash
```
```sh
arp -a
nc server 4242 # then speak to the server
```
> Inquisitor will show the traffic between the client and the server.

```sh
sudo make docker-stop
sudo make docker-fclean
```
