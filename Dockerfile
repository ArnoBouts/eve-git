FROM debian

RUN apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
		ca-certificates \
		git-core \
		npm \
	&& rm -rf /var/lib/apt/lists/* 

RUN npm install git-credential-env

COPY /eve.sh /eve.sh
