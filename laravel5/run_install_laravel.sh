
#!/bin/bash
set -e
# After copying the repo of your project
# run this script to run composer update
# and preform some basic required actions.

echo "running composer update"
cd /var/www/webapp/ && /usr/local/bin/composer update --no-scripts
#php /var/www/artisan migrate --force

echo "starting php5-fpm && nginx"
service cron start
service php5-fpm start && nginx