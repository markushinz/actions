FROM alpine:3.16.1 as builder
COPY install.sh lock.sh unlock.sh ./
RUN apk update && \
    apk upgrade && \
    apk add bash curl jq && \
    ./install.sh && \
    rm -f install.sh && \
    apk del curl jq
