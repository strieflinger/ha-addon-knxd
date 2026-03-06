ARG BUILD_FROM
FROM ${BUILD_FROM}

RUN apt-get update \
    && apt-get install -y --no-install-recommends knxd \
    && rm -rf /var/lib/apt/lists/*

COPY run.sh /
RUN chmod +x /run.sh

CMD ["/run.sh"]
