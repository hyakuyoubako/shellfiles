#!/bin/bash

#BME280エラーチェック
#GPIO21の初期化
#copyright o.

sudo echo 21 > /sys/class/gpio/unexport
sudo echo 21 > /sys/class/gpio/export
sudo echo out > /sys/class/gpio/gpio21/direction

#LED消灯
sudo echo 0 > /sys/class/gpio/gpio21/value
sleep 3s
#何分前に更新されたかチェック
if [ -n "`find /home/pi/denpa-gardening/sensor_data/sensor_data.csv -mmin -10 -print`" ] ; then
	
	sudo echo 1 > /sys/class/gpio/gpio21/value
	sleep 3
	sudo echo 0 > /sys/class/gpio/gpio21/value
	


#更新されていない場合、LED点滅
else
for i in `seq 0 60`
	do
	sudo echo 1 > /sys/class/gpio/gpio21/value
	sleep 0.5
	sudo echo 0 > /sys/class/gpio/gpio21/value
	sleep 0.5
	done
fi
