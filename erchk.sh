#!/bin/bash

#BME280エラーチェック
#GPIO21の初期化
#copyright o.

echo 21 > /sys/class/gpio/unexport
echo 21 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio21/direction

#LED消灯
echo 0 > /sys/class/gpio/gpio21/value
sleep 3s
#何分前に更新されたかチェック
if [ -n "`find /home/pi/denpa-gardening/sensor_data/sensor_data.csv -mmin -10 -print`" ] ; then
	
	echo 1 > /sys/class/gpio/gpio21/value
	sleep 3
	echo 0 > /sys/class/gpio/gpio21/value
	


#更新されていない場合、LED点滅
else
for i in `seq 0 60`
	do
	echo 1 > /sys/class/gpio/gpio21/value
	sleep 0.5
	echo 0 > /sys/class/gpio/gpio21/value
	sleep 0.5
	done
fi
