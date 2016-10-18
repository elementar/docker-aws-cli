FROM alpine:3.4
MAINTAINER Elementar Sistemas <contato@elementarsistemas.com.br>

RUN apk add --no-cache py-pip && pip install awscli