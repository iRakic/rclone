FROM alpine:latest

LABEL maintainer="Ivan Rakic"

RUN apk add --no-cache bash curl unzip ca-certificates fuse openssh-client \
  && wget -qO- https://rclone.org/install.sh | bash \
  && apk del curl unzip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]