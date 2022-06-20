#!/usr/bin/env bash

docker run --rm -it -v $(pwd)/certs:/certs -w /certs openssl-j11:3.0.0 ./gen_fritz_cert.sh