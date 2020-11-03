FROM ruby:2.7.2-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
        bash \
        curl \
        g++ \
        less \
        linux-headers \
        make \
        patch \
        tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
    && mkdir /opt/project \
    && echo -e "install: --no-document\nupdate: --no-document" > /etc/gemrc
WORKDIR /opt/project
