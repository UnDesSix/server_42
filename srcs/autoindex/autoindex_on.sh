#!/bin/sh

rm /etc/nginx/sites-available/default
cp /root/autoindex_on/default /etc/nginx/sites-available
service nginx reload
