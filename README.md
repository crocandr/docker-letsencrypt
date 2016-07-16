# Letsencrypt container for SSL key generation

## Build

```
docker built -t my/letsencrypt .
```

## Run

From your build:

```
docker run -tid --name=letsencrypt -v /srv/nginx/ssl:/etc/letsencrypt -v /srv/nginx/web:/srv/www my/letsencrypt /opt/start.sh
```

Folders:

  - `/srv/nginx/ssl` - is the ssl key folder's of your web server on your docker host
  - `/etc/letsencrypt` - is the letsencrypt's SSL folder in the container (default)
  - `/srv/nginx/web` - is the template directory for the letsencrypt`s checks (.well-known folder) on your docker host
  - `/srv/www` - is the web folder in the container. The generator script uses this folder for your web server.

##

The container generates cert with this script.

```
docker exec -ti letsencrypt /opt/letsencrypt-gen.sh myblog.mydomain.com 0
```

  - `/opt/letsencrypt-gen.sh` - the generator script
  - `myblog.mydomain.com` - is the name of your domain
  - `0` - you can choose the generator script uses `www.` prefix with your domain or not
    Example:
      - `1` - the script generates SSL cert for `mydomain.com` and `www.mydomain.com`
      - `0` - the script generates SSL cert only for `mydomain.com` or your subdomain, etc...

