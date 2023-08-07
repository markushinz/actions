FROM alpine:3.18.3 as builder
COPY install.sh lock.sh unlock.sh ./
RUN apk update && \
    apk upgrade && \
    apk add bash curl jq && \
    ./install.sh && \
    rm -f install.sh && \
    apk del curl jq
