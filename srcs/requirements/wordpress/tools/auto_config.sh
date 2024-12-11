#!/bin/bash

sleep 10

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

        wp core download --allow-root
	wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root
	wp core install --allow-root --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIM --admin_password=$WORDPRESS_ADMIM_PASS  --admin_email=$WORDPRESS_ADMIM_EMAIL --skip-email
	wp plugin update --path="." --allow-root --all
	wp user create $WORDPRESS_USER $WORDPRESS_EMAIL --role=author --user_pass=$WORDPRESS_USER_PASS --allow-root
	wp theme install twentysixteen --activate --allow-root
fi

php-fpm7.4 -F
