#!/usr/bin/env bash

PWD="fritz!key"
DAYS=389

openssl3 req -new -newkey rsa:2048 -keyout fritzbox.key -out fritzbox.csr -config fritzbox.cnf -nodes
openssl3 x509 -req -days ${DAYS} -in fritzbox.csr -CA ca-root.crt -CAkey ca-root.key -CAcreateserial -out fritzbox.crt -extfile fritzbox.cnf -extensions v3_req

# show certificate
echo
echo "############################"
echo "Created Certificate:"
openssl3 x509 -in fritzbox.crt -text -subject -issuer

# Create PEM output required by FRITZ!Box (see https://avm.de/service/wissensdatenbank/dok/FRITZ-Box-7490/1525_Eigenes-Zertifikat-in-FRITZ-Box-importieren/)
openssl3 pkcs12 -export -in fritzbox.crt -inkey fritzbox.key -chain -CAfile ca-root.pem -name fritz.box -out fritzbox.p12 -password pass:${PWD}
openssl3 pkcs12 -in fritzbox.p12 -out fritzbox.pem -passin pass:${PWD} -passout pass:${PWD}
