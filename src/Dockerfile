FROM debian:11

RUN apt-get update -y && \
	apt-get install tor nginx openssh-server -y

RUN useradd -m tonto

COPY ./tor_src/torrc /etc/tor/torrc
COPY ./nginx_src/index.html /usr/share/nginx/html/index.html
COPY ./nginx_src/nginx.conf /etc/nginx/nginx.conf
COPY ./ssh_src/sshd_config /etc/ssh/sshd_config

#COPY entrypt.sh /home

#RUN chmod 711 /home/entrypt.sh

#ENTRYPOINT ["/home/entrypt.sh", "tor", "service ssh start"]
ENTRYPOINT nginx; service ssh start; tor
