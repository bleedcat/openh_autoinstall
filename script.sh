wget -q https://git.io/voEUQ -O /tmp/raspap && bash /tmp/raspap

sudo apt update
sudo apt install openjdk-8-jdk
sudo update-alternatives --config java

wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key
sudo apt-key add mosquitto-repo.gpg.key
cd /etc/apt/sources.list.d/
sudo wget http://repo.mosquitto.org/debian/mosquitto-jessie.list
sudo wget http://repo.mosquitto.org/debian/mosquitto-stretch.list
sudo wget http://repo.mosquitto.org/debian/mosquitto-buster.list
cd
sudo apt-get update
sudo apt-get install mosquitto -y
sudo apt-get install mosquitto-clients -y
sudo apt-get install libmosquitto-dev -y
wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=openhab' | sudo apt-key add -
sudo apt-get install apt-transport-https
echo 'deb https://dl.bintray.com/openhab/apt-repo2 stable main' | sudo tee /etc/apt/sources.list.d/openhab2.list
sudo apt-get update
sudo apt-get install openhab2 -y
sudo apt-get install openhab2-addons -y
sudo systemctl daemon-reload
sudo systemctl enable openhab2.service
sudo systemctl start openhab2.service
