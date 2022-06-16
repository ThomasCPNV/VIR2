#!/bin/sh
apt -y update && upgrade
apt install -y docker docker-compose git
git clone https://github.com/7ric/Photoblog.git /Photoblog
sed -i 's/localhost/db/g' /Photoblog/classes/db.php
wget -nc https://raw.githubusercontent.com/ThomasCPNV/VIR2/main/docker-compose.yaml
docker-compose up -d
docker-compose exec -T websrv docker-php-ext-install mysql
docker-compose exec -T websrv /etc/init.d/apache2 reload
