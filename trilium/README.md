### info
- [trilium](https://github.com/zadam/trilium)
- [nginx-le](https://github.com/nginx-le/nginx-le)

---

### run
```bash
docker-compose up -d
```

### debug
```bash
docker-compose logs -f trilium_nginx
docker-compose logs -f trilium_instance

docker exec -it trilium_nginx /bin/sh
```

### rm
```bash
docker stop trilium_nginx && docker rm trilium_nginx
docker stop trilium_instance && docker rm trilium_instance
```
