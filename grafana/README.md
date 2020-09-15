### info

- [Prometheus](https://github.com/prometheus/prometheus)
- [NodeExporter](https://github.com/prometheus/node_exporter)
- [cAdvisor](https://github.com/google/cadvisor)
- [Pushgateway](https://github.com/prometheus/pushgateway)
- [Grafana](https://github.com/grafana/grafana)
- [Alertmanager](https://github.com/prometheus/alertmanager)
- [dockprom](https://github.com/stefanprodan/dockprom)

---

### run
```shell script
ADMIN_USER=admin ADMIN_PASSWORD=admin docker-compose up -d
```

- monitoring multiple remote hosts
1. run on unit-host
```shell script
docker-compose -f docker-compose.exporters.yml up -d
```

2, update prometheus.yml on nexus

https://github.com/stefanprodan/dockprom/issues/171
