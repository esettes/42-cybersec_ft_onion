FROM alpine:edge

RUN apk update && apk upgrade && \
	apk add tor

COPY ./src/torrc /etc/tor/torrc

RUN adduser -S usertor

CMD ["tor"]
