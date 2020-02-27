#FROM scratch
#FROM alpine:3.11
FROM centos:7

ADD ./bin/gotty /usr/bin
ADD ./bin/kubectl /usr/bin

ADD run.sh /

RUN mkdir -p /var/local/gotty; groupadd -g 1000 gotty; \
    useradd -u 1000 -g gotty -d /var/local/gotty -m gotty; \
    chown -R gotty:gotty /var/local/gotty; \
    chown -R gotty:gotty /run.sh;
USER gotty
WORKDIR /var/local/gotty

ENV BASICM = true
ENV USERPWD = "lionel:hr"
ENV CONTAINERNAME = "lionel"
ENV CONTAINERNAME = "lionel"

ENTRYPOINT ["sh", "/run.sh"]