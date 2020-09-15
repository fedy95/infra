FROM ubuntu:20.04

RUN apt-get -q update && \
    apt-get install -y --no-install-recommends smartmontools && \
    apt-get clean && \
    rm -rf /tmp/* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/tmp/*

ADD script/entrypoint.sh /entrypoint.sh
ADD script/smartmon.sh /smartmon.sh

RUN chmod +x /entrypoint.sh && \
    chmod +x /smartmon.sh

ENTRYPOINT ["/entrypoint.sh"]
