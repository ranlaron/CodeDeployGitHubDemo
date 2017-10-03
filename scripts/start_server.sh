#!/bin/bash
# sudo chmod 755 /var/www/server.js # optional
# this will restart app/server on instance reboot
crontab -l | { cat; echo "@reboot pm2 start /var/www/www -i 0 --name \"node-app\""; } | crontab -
pm2 stop node-app
# actually start the server
pm2 start /var/www/www -i 0 --name "node-app"
