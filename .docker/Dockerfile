FROM node:6-alpine
RUN npm i -g node-sass
ENV NODE_PATH=/usr/local/lib/node_modules

# install awscli
RUN \
	mkdir -p /aws && \
	apk -Uuv add groff less python py-pip && \
	pip install awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*