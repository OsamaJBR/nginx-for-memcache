
# Nginx Load Balancer for MemcacheD
-----------------
In release 1.5 and later, NGINX can proxy and load balance TCP traffic, using the –with-steam flag in the build time.
## Usage
-----------------
##### Build it
``` 
docker build -f Dockerfile -t nginx-for-memcache .
``` 
##### Run it
```
docker run -d -p 6663:6663 \
        -e NGINX_WORKERS=1024 \
        -e NGINX_PORT=6663 \
        -e NGINX_UPSTREAM_SERVERS=server memcached1_ip:11211; server memcached1_ip:11211; \
        --name memcache-lb nginx-for-memcache
```

## Read More 
-----------------
######  http://engineering.opensooq.com/experiment-nginx-tcpudp-load-balancer-with-memcached/

