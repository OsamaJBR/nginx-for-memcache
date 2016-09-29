
# Nginx Load Balancer for MemcacheD
-----------------
As know NGINX since version 1.5 can proxy and load balance TCP traffic, using the --with-steam flag in the build time. 

In this expirement I was trying to deploy a high available memcached pool of smaller instances using Nginx LB and Memcached.
Read more about this here : http://engineering.opensooq.com/experiment-nginx-tcpudp-load-balancer-with-memcached/

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
