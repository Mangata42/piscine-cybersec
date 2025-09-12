#!/bin/bash

service nginx start
service tor start
/usr/sbin/sshd -D
cat /var/lib/tor/hidden_service/hostname