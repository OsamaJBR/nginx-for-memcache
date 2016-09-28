#!/bin/bash

CONFD_OPTIONS=${CONFD_OPTIONS:-"-onetime -backend=env"}
cd /app/ && /usr/local/bin/confd -log-level=debug $CONFD_OPTIONS -confdir=$PWD/confd

# forward request and error logs to docker log collector                                                                               
ln -sf /dev/stdout  /usr/local/nginx/logs/error.log

command=$1
shift
case $command in
    bash)
	exec /bin/bash
	;;
    *)
	exec /usr/local/nginx/nginx -g "daemon off;"
    ;;
esac
	
