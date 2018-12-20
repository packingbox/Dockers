FROM golang:alpine as builder
RUN apk add --update git
#get current brook
RUN go get github.com/txthinking/brook/releases/download/v20181212/brook


FROM chenhw2/alpine:base
LABEL MAINTAINER CHENHW2 <https://github.com/chenhw2>

# /usr/bin/brook
COPY --from=builder /go/bin /usr/bin

USER nobody
ENV ARGS="server -l :6060 -p password"
EXPOSE 6060/tcp 6060/udp

CMD /usr/bin/brook ${ARGS}
