### info
- [docker-pi-hole](https://github.com/pi-hole/docker-pi-hole)
- [pi-hole](https://github.com/pi-hole/pi-hole)

- external service

### run
```shell script
netstat -ntlp | grep LISTEN # for check a port 53

sudo sed -r -i.orig 's/#?DNSStubListener=yes/DNSStubListener=no/g' /etc/systemd/resolved.conf
sudo sh -c 'rm /etc/resolv.conf && ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf'
systemctl restart systemd-resolved

docker-compose up -d
```

### debug
```shell script
docker-compose logs -f pihole

docker exec -it nginx /bin/sh

# change password
pihole -a -a

# show password
docker logs pihole | grep random
```

### windows-client debug
```shell script

- nslookup pi.hole
- nslookup pi.hole 192.168.1.50

## correct response
:  pihole
Address:  192.168.1.50

:     pi.hole
Address:  192.168.1.50

- ipconfig /flushdns

## correct response
:  pihole
Address:  192.168.1.50

:     flurry.com
Addresses:  ::
          0.0.0.0
```
