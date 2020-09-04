FROM alpine:latest

ENV TENDERMINT_VERSION v0.33.8

WORKDIR /tmp

RUN wget https://github.com/tendermint/tendermint/releases/download/${TENDERMINT_VERSION}/tendermint_${TENDERMINT_VERSION}_linux_amd64.zip \
 && unzip tendermint_${TENDERMINT_VERSION}_linux_amd64.zip \
 && mv tendermint /usr/local/bin \
 && rm -rf tmp/* \
 && adduser -D -s /bin/sh tendermint

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER tendermint

WORKDIR /home/tendermint

EXPOSE 46656

VOLUME /home/tendermint

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]