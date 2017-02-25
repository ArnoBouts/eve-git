FROM alpine

RUN apk update \
	&& apk add --no-cache \
		git

COPY /eve.sh /eve.sh
