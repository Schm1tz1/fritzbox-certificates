#!/usr/bin/env bash

# Generate CA certificates and concatenate to PEM
openssl3 req -new -nodes -x509 -days 3650 -newkey rsa:2048 -keyout ca-root.key -out ca-root.crt -config ca-root.cnf
cat ca-root.crt ca-root.key > ca-root.pem

# show certificate
echo
echo "############################"
echo "Created CA:"
openssl3 x509 -in ca-root.crt -text | less

