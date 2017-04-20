#!/bin/bash

WEBROOT="/srv/www/"
#CERTPATH="/etc/letsencrypt"
[ $MAIL ] || MAIL="webmaster@$DOMAIN"
[ $ROOTDOMAIN ] || $ROOTDOMAIN=1


if [ ! $DOMAIN ]
then
  echo "Usage:"
  echo "Root domain: DOMAIN=<domain name> && $0 \$DOMAIN"
  echo "  Example: DOMAIN=example.com && $0 \$DOMAIN"
  echo "  For example.com and www.example.com"
  echo "Subdomain: DOMAIN=<subdomain name> && $0 \$DOMAIN"
  echo "  Example: ROOTDOMAIN=0 && DOMAIN=test.example.com && $0 \$DOMAIN"
  
  exit 1
fi

if [ $ROOTDOMAIN -eq 1 ]
then
  # with www
  DOMAINPARAMS="-d $DOMAIN -d www.$DOMAIN"
else
  # without www
  DOMAINPARAMS="-d $DOMAIN"
fi

letsencrypt certonly --renew-by-default -t --email "$MAIL" "$DOMAINPARAMS" --webroot -w "$WEBROOT" #--cert-path "$CERTPATH"
