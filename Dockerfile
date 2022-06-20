FROM alpine:3.15.0
LABEL maintainer="roman.schmitz@gmail.com"
LABEL summary="OpenSSL3/Alpine"
RUN apk add openssl3 bash openjdk11
