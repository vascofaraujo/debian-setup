#!/bin/bash

function clean(){
    sudo apt clean
    yes | sudo apt autoremove
}
echo "--------------------------"
echo "--------------------------"
echo "1/X - Update the system"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt update && sudo apt upgrade

echo "--------------------------"
echo "--------------------------"
echo "2/X - Removing Games"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt purge gnome-games
clean

echo "--------------------------"
echo "--------------------------"
echo "3/X - Removing Firefox"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt purge firefox
clean

echo "--------------------------"
echo "--------------------------"
echo "4/X - Installing Gnome Tweaks"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt install gnome-tweaks
clean

echo "--------------------------"
echo "--------------------------"
echo "5/X - Installing Brave Browser"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
yes | sudo apt update
yes | sudo apt install brave-browser

echo "--------------------------"
echo "--------------------------"
echo "6/X - Installing Discord"
echo "--------------------------"
echo "--------------------------"
cd ~/Downloads
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
yes | sudo dpkg -i discord.deb

echo "--------------------------"
echo "--------------------------"
echo "7/X - Installing Atom"
echo "--------------------------"
echo "--------------------------"
cd ~/Downloads
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'
yes | sudo apt-get update
yes | sudo apt-get install atom

echo "--------------------------"
echo "--------------------------"
echo "8/X - Installing Zoom"
echo "--------------------------"
echo "--------------------------"
cd ~/Downloads
wget https://zoom.us/client/latest/zoom_amd64.deb
yes | sudo apt install ./zoom_amd64.deb

echo "--------------------------"
echo "--------------------------"
echo "9/X - Installing Evernote"
echo "--------------------------"
echo "--------------------------"
cd ~/Downloads
wget https://cdn1.evernote.com/boron/linux/builds/Evernote-10.7.6-linux-ddl-ga-2321.deb -O evernote.deb
yes | sudo apt install ./evernote.deb

echo "--------------------------"
echo "--------------------------"
echo "10/X - Installing Spotify"
echo "--------------------------"
echo "--------------------------"
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
yes | sudo apt-get install spotify-client

echo "--------------------------"
echo "--------------------------"
echo "11/X - Installing Git"
echo "--------------------------"
echo "--------------------------"
yes | sudo apt install git-all


echo "--------------------------"
echo "--------------------------"
echo "12/X - Creating custom folder"
echo "--------------------------"
echo "--------------------------"
cd ~/Desktop
mkdir CODE
cd CODE
git clone https://github.com/vascofaraujo/Useful_Python_Scripts.git
git clone https://github.com/vascofaraujo/UAV_Mapping.git

echo "--------------------------"
echo "--------------------------"
echo "13/X - Installing wifi and bluetooth drivers"
echo "--------------------------"
echo "--------------------------"
cd ~
git clone https://github.com/tomaspinho/rtl8821ce.git
cd ~/rtl8821ce
yes | sudo ./dkms-install.sh
yes | sudo apt install firmware-realtek

echo "--------------------------"
echo "--------------------------"
echo "14/X - Adding bash aliases"
echo "--------------------------"
echo "--------------------------"
echo '# Added aliases' >> ~/.bashrc
echo 'alias bu="sudo apt update && sudo apt upgrade"' >> ~/.bashrc
echo 'alias c="cd ~/Desktop/CODE/"' >> ~/.bashrc


echo "------------------------------------------------"
echo "All done, bye!"
echo "------------------------------------------------"
