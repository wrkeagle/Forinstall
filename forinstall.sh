#!/bin/bash

echo "Welcome to the automated installer"
echo "who are you?"
echo "username:" read varname
echo "checking permissions..."

if (($EUID != 0 )); then
    echo "Please run as root"
    exit
fi


sleep 3s
echo "Starting the installation"
echo "."
sleep 0.4
echo "."
sleep 0.5
echo "."
clear
echo "Starting the installation..."
clear

echo "UPDATING SYSTEM SOURCES"
xterm -e 'sudo apt update'
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install -y ngrok
sudo apt install -y figlet lolcat feroxbuster cherrytree 
wget https://github.com/flameshot-org/flameshot/releases/download/v11.0.0/flameshot-11.0.0-1.debian-10.amd64.deb && sudo gdebi -n flameshot-11.0.0-1.debian-10.amd64.deb
echo "cleaning..."
rm flameshot-11.0.0-1.debian-10.amd64.deb
clear

echo "
  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S

    Installing HTB Theme ... 
  "

echo "Installing sources" 
clear
echo "
  █  █         ▐▌     ▄█▄ █          ▄▄▄▄
  █▄▄█ ▀▀█ █▀▀ ▐▌▄▀    █  █▀█ █▀█    █▌▄█ ▄▀▀▄ ▀▄▀
  █  █ █▄█ █▄▄ ▐█▀▄    █  █ █ █▄▄    █▌▄█ ▀▄▄▀ █▀█

  P  E  N   -   T  E  S  T  I  N  G     L  A  B  S
  
  Installing custom bashrc ...
  "
echo ""

wget https://github.com/wrkeagle/Forinstall/blob/main/bashrc

rm /home/$varname/.bashrc
sudo cp bashrc /home/$varname/.bashrc
sudo rm /root/.bashrc
sudo rm /root/.zshrc
sudo cp bashrc /root/.zshrc
sudo mv bashrc /root/.bashrc

figlet DONE 





