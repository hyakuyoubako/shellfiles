#!/bin/sh

set -eu
sleep 5s
sudo cp -u /home/pi/denpa-gardening/sensor_data/*.png /var/www/html/
sudo cp -u /home/pi/denpa-gardening/sensor_data/sensor_data*.csv /var/www/html/


