#!/bin/sh

. /etc/dtdns/dtdns.conf

CURRENTIP=$(ifconfig ${INTERFACE} | grep inet\  | awk '{ print $2 }')
DTDNSIP=$(dig +short $DOMAIN @${DTDNSSERVER})

if [ "$CURRENTIP" != "$DTDNSIP" ]; then
  REQUESTURL="https://www.dtdns.com/api/autodns.cfm?id=${DOMAIN}&pw=${DTDNSPASSWORD}&client=OpenBSD"
  MSG=$(wget -q --ca-certificate=${DTDNSCERT} -O - ${REQUESTURL} )

  # echo $MSG
  logger $MSG
  pfctl -k 192.168.2.2 # Kills connection from SIP phone
else
  # MSG="IP hasn't changed - still ${DTDNSIP}"
  echo $MSG
fi
