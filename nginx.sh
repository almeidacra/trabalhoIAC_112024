#!/bin/bash
yum update -y
amazon-linux-extras enable nginx1
yum install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>Bem Vindo ao NGINX Server</h1>" > /usr/share/nginx/html/index.html
