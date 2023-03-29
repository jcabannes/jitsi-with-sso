## Initialization

Add the following line to your `/etc/hosts` file:
```
127.0.0.1  auth.example.com
```

Then, initialize folder using [./init.sh](./init.sh) script.

NB: Use the `clean.sh` script to delete jitsi-meet-cfg folder.

## Run

* After initialization run `docker compose up`
* Local Jitsi server is avaible at https://localhost:8443/ and SSO portal at https://auth.example.com
* Here are the available accounts on SSO: 
  * id: dwho, password: dwho
  * id: rtyler, password: rtyler
  * id: msmith, password: msmith

## Current bug

Container jitsi-openid does not start, it gets the following warning from `rustls`: 'Sending fatal alert BadCertificate'
```
Error: Request failed

Caused by:
    0: request failed
    1: error sending request for url (https://auth.example.com/.well-known/openid-configuration): error trying to connect: invalid peer certificate contents: invalid peer certificate: UnsupportedCertVersion
    2: error trying to connect: invalid peer certificate contents: invalid peer certificate: UnsupportedCertVersion
    3: invalid peer certificate contents: invalid peer certificate: UnsupportedCertVersion
```

This error can be see with `docker logs` command.