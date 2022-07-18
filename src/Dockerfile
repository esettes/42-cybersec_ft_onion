FROM alpine:edge

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL maintainer="Mr. Miau" \
	org.label-schema.build-date=$BUILD_DATE \
	org.label-schema.name="Tor network client (daemon)" \
	org.label-schema.url="https://www.torproject.org" \
	org.label-schema.vcs-url="https://github.com/osminogin/docker-tor-simple" \
	org.label-schema.vcs-ref=$VCS_REF \
	org.label-schema.schema-version="1.0" \
	org.label-schema.version=$VERSION

# Modifies tor config to hear at 9050
RUN apk add --no-cache curl tor && \
	sed "1s/^/SocksPort 0.0.0.0:9050\n/" /etc/tor/torrc.sample > /etc/tor/torrc

EXPOSE 9050

# Automatic check of tor working every 60 sec. Makes a curl at localhost:9050, if responds before 15 sec
# it means it is working. If no responds, container restarts. Is it continues not working, it stops.
HEALTHCHECK --interval=60s --timeout=15s --start-period=20s \
	CMD curl -s --socks5 127.0.0.1:9050 'https://check.torproject.org/' | grep -qm1 Congratulations

# Persistence
VOLUME ["/var/lib/tor"]

USER tor

CMD ["tor"]
