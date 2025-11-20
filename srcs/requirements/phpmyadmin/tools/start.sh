#!/bin/bash

# Create PHPMyAdmin configuration file
cat > /var/www/phpmyadmin/config.inc.php << EOF
<?php
\$cfg['blowfish_secret'] = 'H2OxcGXxflSd8JwrwVlh6KW6s2rER63i';

\$i = 0;
\$i++;
\$cfg['Servers'][\$i]['auth_type'] = 'cookie';
\$cfg['Servers'][\$i]['host'] = '${MYSQL_HOSTNAME}';
\$cfg['Servers'][\$i]['port'] = '3306';
\$cfg['Servers'][\$i]['compress'] = false;
\$cfg['Servers'][\$i]['AllowNoPassword'] = false;

\$cfg['UploadDir'] = '';
\$cfg['SaveDir'] = '';
\$cfg['TempDir'] = '/tmp';
?>
EOF

chmod 644 /var/www/phpmyadmin/config.inc.php

echo "PHPMyAdmin configured successfully"

# Start PHP-FPM in foreground
php-fpm7.4 -F
