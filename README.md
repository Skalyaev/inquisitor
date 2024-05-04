# <p align="center">inquisitor</p>
> *Projet d'introduction à la compréhension du réseau d'un point de vue bas niveau.*
>
> *Le modèle OSI est l'architecture suivie par les réseaux informatiques du monde entier. Il se compose de 7 couches, chacune d'entre elles comportant des risques et étant exposée à différents types de vulnérabilités et d'exploits.*
>
> *Au niveau réseau, il existe des éléments chargés de décider de la direction à prendre par le trafic. Chaque réseau local dispose d'une passerelle par défaut, qui reçoit le trafic externe et le distribue entre ses nœuds. Cette passerelle est aussi généralement appelée routeur.*
>
> *Si un nœud de réseau parvient à se faire passer pour la passerelle, il peut prendre le contrôle du trafic, l'intercepter et décider vers qui le rediriger, ainsi que le modifier ou le bloquer.*
>
>*Le spoofing ARP peut également être utilisé de manière légitime, par exemple pour rediriger les nouvelles connexions vers une page d'enregistrement avant d'utiliser un réseau, comme c'est le cas dans les réseaux "portes ouvertes" des aéroports, des cafétérias et autres lieux publics.*
>
> *Vous devez créer un programme appelé "inquisitor" avec les caractéristiques suivantes :*
> * *Il doit être développé pour la plateforme Linux.*
> * *Il doit prendre au moins ces 4 paramètres :*
>   - *\<IP-source>*
>   - *\<MAC-source>*
>   - *\<IP-cible>*
>   - *\<MAC-cible>*
> * *Le programme doit uniquement fonctionner avec des adresses IPv4.*
> * *Le programme ne doit jamais s'arrêter de façon inattendue et doit gérer toutes les erreurs d'entrée.*
>
> *Votre programme doit effectuer plusieurs actions décrites ci-dessous :*
> * *Il doit être capable d'effectuer un empoisonnement ARP dans les deux sens (full duplex).*
> * *Lorsque l'attaque est stoppée (CTRL+C), les tables ARP seront restaurées.*

## Install
```bash
sudo apt update -y
sudo apt install -y make
sudo apt install -y docker.io
```
```bash
git clone https://github.com/Skalyaeve/inquisitor.git
cd inquisitor && sudo make docker
```

## Usage
```bash
sudo docker exec -it inquisitor bash
```
```bash
ping -c 1 client
ping -c 1 server

mac1=$(arp -a | grep client | awk '{print $4}')
ip1=$(arp -a | grep client | awk '{print $2}' | sed 's/[()]//g')

mac2=$(arp -a | grep server | awk '{print $4}')
ip2=$(arp -a | grep server | awk '{print $2}' | sed 's/[()]//g')

./inquisitor -v $mac1 $ip1 $mac2 $ip2
```
- Ouvre un nouveau terminal pour le server
```bash
sudo docker exec -it server bash
```
```bash
arp -a
nc -vlnp 4242
```
- Ouvre un nouveau terminal pour le client
```sh
sudo docker exec -it client bash
```
```sh
arp -a
nc server 4242
# envoie un message
```
- Inquisitor affiche le traffic entre le client et le server

```bash
sudo make docker-stop
sudo make docker-clean
```
