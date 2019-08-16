FROM alpine:3.10
LABEL maintainer="Dan Sosedoff <dan.sosedoff@gmail.com>"
ENV PGWEB_VERSION 0.11.3

RUN \
  apk update && \
  apk add --no-cache ca-certificates openssl postgresql wget && \
  update-ca-certificates && \
  rm -rf /var/cache/apk/* && \
  cd /tmp && \
  wget -q https://github.com/sosedoff/pgweb/releases/download/v$PGWEB_VERSION/pgweb_linux_amd64.zip && \
  unzip pgweb_linux_amd64.zip -d /usr/bin && \
  mv /usr/bin/pgweb_linux_amd64 /usr/bin/pgweb && \
  rm -f pgweb_linux_amd64.zip

EXPOSE 8080
CMD ["/usr/bin/pgweb", "--bind=0.0.0.0", "--listen=8080"]
