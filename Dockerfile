FROM debian

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		git-core \
	&& rm -rf /var/lib/apt/lists/* 

COPY /entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
