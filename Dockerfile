FROM ruby:2.7-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        bash \
        curl \
        g++ \
        linux-headers \
        make \
        patch \
        tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN apk update
RUN mkdir /opt/project && echo -e "install: --no-document\nupdate: --no-document" > /etc/gemrc
WORKDIR /opt/project
