#!/bin/bash

DOMAIN=$1
WEBROOT="/srv/www/$DOMAIN/html"
#CERTPATH="/etc/letsencrypt"
MAIL="webmaster@$DOMAIN"

if [ ! $1 ] || [ $1 == "-h" ] || [ $1 == "--help" ]
then
  echo "Usage: $0 <domain name> [ 0 | 1 ]"
  echo "Please define domain name without www. prefix!"
  echo "If you wouldn't use www. prefix, please set 2nd params to 0"
  echo "Example: "
  echo "$0 mydomain.com 0"
  echo "OR"
  echo "$0 mydomain.com"
  exit 1
fi

if [ ! -z $2 ] && [ $2 -eq 1 ]
then
  # with www
  DOMAINPARAMS="-d $DOMAIN -d www.$DOMAIN"
else
  # without www
  DOMAINPARAMS="-d $DOMAIN"
fi

letsencrypt certonly --renew-by-default -t --email "$MAIL" "$DOMAINPARAMS" --webroot -w "$WEBROOT" #--cert-path "$CERTPATH"
