sudo apt update
sudo apt install openjdk-8-jdk -y
sudo update-alternatives --config java

wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key

cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
sudo wget http://repo.mosquitto.org/debian/mosquitto-buster.list
cd

sudo apt update
sudo apt install mosquitto -y
sudo apt install mosquitto-clients -y
sudo apt install libmosquitto-dev -y

wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab' | sudo apt-key add -
sudo apt install apt-transport-https

echo 'deb https://dl.bintray.com/openhab/apt-repo2 stable main' | sudo tee /etc/apt/sources.list.d/openhab2.list
sudo apt update
sudo apt install openhab2 -y
sudo apt install openhab2-addons -y
sudo systemctl daemon-reload
sudo systemctl enable openhab2.service
sudo systemctl start openhab2.service

sudo chmod 777 /etc/mosquitto/mosquitto.conf
sudo echo "port 1337" >> /etc/mosquitto/mosquitto.conf
sudo chmod 644 /etc/mosquitto/mosquitto.conf

sudo systemctl start mosquitto.service
sudo systemctl enable mosquitto.service
wget -q https://git.io/voEUQ -O /tmp/raspap && bash /tmp/raspap
