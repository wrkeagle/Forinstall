#!/bin/bash

echo "Welcome to the automated installer"
echo "checking permissions..."

if (($EUID != 0 )); then
    echo "Please run as root"
    exit
fi


sleep 3s
echo "Starting the installation"
echo "."
sleep 0.2
echo "."
sleep 0.2
echo "."
clear

sudo apt update
sudo apt upgrade
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
sudo apt install -y figlet lolcat feroxbuster cherrytree 

clear

echo "
  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S

    Installing HTB Theme ... 
  "
  
mkdir ~/gitclones && cd ~/gitclones
echo "installing sources" 

xterm -e git clone https://github.com/theGuildHall/pwnbox.git
clear
echo "
  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S

    Installing HTB Theme ... 
  "
cd ~/gitclones/pwnbox
sudo cp *.sh /opt && sudo cp -R bloodhound/ /opt && sudo cp -R htb/ /opt && sudo cp -R icons/ /opt && sudo cp banner /opt
sudo cp ~/gitclones/pwnbox/htb.jpg /usr/share/backgrounds/
sudo cp -R ~/gitclones/pwnbox/Material-Black-Lime-Numix-FLAT/ /usr/share/icons/
sudo cp -R ~/gitclones/pwnbox/htb /usr/share/icons/
sudo mkdir /usr/share/themes/HackTheBox && sudo cp ~/gitclones/pwnbox/index.theme /usr/share/themes/HackTheBox
echo "Installing custom bashrc ..."


rm ~/.bashrc
mv ~/Downloads/bashrc ~/.bashrc
sudo rm /root/.bashrc
sudo cp ~/.bashrc /root/

figlet DONE | lolcat




