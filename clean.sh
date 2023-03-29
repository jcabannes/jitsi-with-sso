#!/bin/sh

docker-compose down

MYUID=`perl -e 'print $<'`

rm -rf synapse-data

if [ ! -z $(find . -type d -name jitsi-meet-cfg) ]
then
    JITSIWEBARGS="--rm -it -v `pwd`/jitsi-meet-cfg/web:/config jitsi/web:stable-8319"
    docker run --entrypoint="" $JITSIWEBARGS chown -R $MYUID /config

    JITSIPROSODYARGS="--rm -it -v `pwd`/jitsi-meet-cfg/prosody/config:/config jitsi/web:stable-8319"
    docker run --entrypoint="" $JITSIPROSODYARGS chown -R $MYUID /config

    rm -rf jitsi-meet-cfg
fi
