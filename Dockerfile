FROM debian:11.7-slim

ENV COMPOSE_DIR=/compose
ENV LISTEN_PORT=8080

RUN apt-get update && apt-get install -y \
        docker-compose \
        git \
        netcat \
    && rm -rf /var/lib/apt/lists/*

COPY --from=jonoh/sops /usr/local/bin/sops /usr/local/bin/sops

RUN git config --global pull.ff only
COPY known_hosts "/root/.ssh/known_hosts"
COPY monitor.sh /monitor.sh

WORKDIR "${COMPOSE_DIR}"

ENTRYPOINT [ "/monitor.sh" ]
CMD [ "echo", "Override the command to do something useful" ]
