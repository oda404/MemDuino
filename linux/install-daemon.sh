#!/usr/bin/bash
#this script should only be executed through make install
if ! [ -d "/etc/memduino" ]; then
    sudo mkdir /etc/memduino
    sudo cp $(dirname $BASH_SOURCE)/default-argconfig /etc/memduino/.argconfig
elif ! [ -f "/etc/memduino/.argconfig" ]; then 
    sudo cp $(dirname $BASH_SOURCE)/default-argconfig /etc/memduino/.argconfig
fi
sudo systemctl stop memduinod
sudo cp $(dirname $BASH_SOURCE)/../build/daemon/memduinod /usr/bin/
sudo cp $(dirname $BASH_SOURCE)/memduinod.service /usr/lib/systemd/system/
sudo chmod 644 /usr/lib/systemd/system/memduinod.service
sudo systemctl enable memduinod
sudo systemctl start memduinod