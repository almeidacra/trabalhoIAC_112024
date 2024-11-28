#!/bin/bash
yum update -y
yum install -y httpd php php-mysqlnd
systemctl enable httpd
systemctl start httpd
echo "<?php phpinfo(); ?>" > /var/www/html/index.php