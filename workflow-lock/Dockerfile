FROM alpine:3.16.1 as builder
RUN apk update && apk upgrade && apk add bash curl jq
COPY install.sh .
RUN ./install.sh

FROM alpine:3.16.1 as runner
RUN apk update && apk upgrade && apk add bash git
COPY --from=builder /usr/local/bin/gh /usr/local/bin/gh
COPY workflow-lock.sh /usr/local/bin/workflow-lock
COPY workflow-unlock.sh /usr/local/bin/workflow-unlock
