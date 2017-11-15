#!/bin/bash
PROJECT=yiiadvanced
YII_ENV=Development

docker-compose -p ${PROJECT} up -d

#Install Yii2 advanced template
docker exec ${PROJECT}_fpm_1 composer create-project --prefer-dist yiisoft/yii2-app-advanced .

#Setup database host for docker container
sed -i -e 's/localhost/mariadb/g' src/environments/dev/common/config/main-local.php
sed -i -e 's/localhost/mariadb/g' src/environments/dev/common/config/test-local.php

sed -i -e 's/yii2advanced_test/yii2advanced/g' src/environments/dev/common/config/test-local.php

docker exec ${PROJECT}_fpm_1 composer update

docker exec ${PROJECT}_fpm_1 php init --env=${YII_ENV} --overwrite=All
docker exec ${PROJECT}_fpm_1 php ./yii migrate --interactive=0

docker-compose -p ${PROJECT} run --rm codecept run --html report-web.html

