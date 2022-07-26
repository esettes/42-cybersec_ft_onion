FROM debian:11

RUN apt-get update -y && \
	apt-get install tor ssh -y

ENTRYPOINT tor; ssh

