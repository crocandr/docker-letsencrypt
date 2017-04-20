# Letsencrypt container for SSL key generation

## Build

```
docker built -t croc/letsencrypt .
```

## Run

From your build:

```
docker run -tid --name=letsencrypt -v /srv/nginx/ssl:/etc/letsencrypt -v /srv/nginx/web:/srv/www -e MAIL=webmaster@mydomain.com -e ROOTDOMAIN=1 -e DOMAIN=mydomain.com croc/letsencrypt
```

Env. variables:
  - `MAIL` - your mail address
  - `ROOTDOMAIN` - this is an optional variable, 1 - you got cert for yourdomain.com and www.mydomain.com, 0 - you got cert only for test.mydomain.com
  - `DOMAIN` - the name of your domain (example: mydomain.com, test.mydomain.com ... )

Folders:

  - `/srv/nginx/ssl` - is the ssl key folder's of your web server on your docker host
  - `/etc/letsencrypt` - is the letsencrypt's SSL folder in the container (default)
  - `/srv/nginx/web` - is the template directory for the letsencrypt`s checks (.well-known folder) on your docker host
  - `/srv/www` - is the web folder in the container. The generator script uses this folder for your web server.

##

The container generates and renews SSL/HTTPS certficiation for domain with this script that is defined in environment variable.

```
docker exec -ti letsencrypt /opt/letsencrypt-gen.sh
```

  - `/opt/letsencrypt-gen.sh` - the generator script


Good Luck!

Check my Github WIKI page for examples.
