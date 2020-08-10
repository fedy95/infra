### info
- [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole)
- [pi-hole](https://github.com/pi-hole/pi-hole)

### run
```shell script
# for check a port 53
netstat -ntlp | grep LISTEN 

# resolv.conf
ll /etc/resolv.conf 
lrwxrwxrwx 1 root root 39 Apr 23 07:33 /etc/resolv.conf -> ../run/systemd/resolve/stub-resolv.conf

sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
systemctl restart systemd-resolved

docker-compose up -d
```

### debug
```shell script
docker-compose logs -f pihole

docker exec -it pihole /bin/sh

# change password
pihole -a -p

# show password
docker logs pihole | grep random
```

### windows-client debug
```shell script
ipconfig /flushdns
```

```shell script
nslookup pi.hole

## correct response
:  pihole
Address:  192.168.1.49
```

```shell script
nslookup pi.hole 192.168.1.49

## correct response
: pi.hole
Address:  192.168.1.49
```

```shell script
nslookup flurry.com

## correct response
: flurry.com
Addresses:  ::
0.0.0.0
```