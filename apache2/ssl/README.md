# Generate SSL Certificate

## Create private key
- `openssl genrsa -out ssl.key 2048`

## Create Certificate Signing Request
- `openssl req -new -sha256 -key ssl.key -out ssl.csr` 
  - Enter **domain** for the Common Name and then Enter
## Create san.txt
To avoid chrome warning self-signed certificate.
- `echo "subjectAltName = DNS:domain" > san.txt`
## Create certificate
- `openssl x509 -req -sha256 -days 365 -signkey ssl.key -in ssl.csr -out ssl.crt -extfile san.txt`
