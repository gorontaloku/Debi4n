#!/bin/bash

username="$1"

pkgs=('git' 'neofetch' 'virglrenderer-android' 'papirus-icon-theme' 'eza' 'pavucontrol-qt' 'bat' 'jq' 'nala' 'wmctrl' 'netcat-openbsd' 'termux-x11-nightly' 'eza')

#Install xfce4 desktop and additional packages
pkg install "${pkgs[@]}" -y -o Dpkg::Options::="--force-confold"

#Put Firefox icon on Desktop
#cp $PREFIX/share/applications/firefox.desktop $HOME/Desktop 
#chmod +x $HOME/Desktop/firefox.desktop

#Set aliases
echo "
alias debian='proot-distro login debian --user $username --shared-tmp'
alias hud='GALLIUM_HUD=fps '
alias ls='eza -lF --icons'
alias cat='bat '
alias apt='nala '
alias install='nala install -y '
alias uninstall='nala remove -y '
alias search='nala search '
alias list='nala list --upgradeable'
alias show='nala show'
" >> $PREFIX/etc/bash.bashrc

#Install WhiteSur-Dark Theme
wget https://github.com/gorontaloku/Debi4n/raw/refs/heads/main/Qogir.tar.x
tar -xf Qogir.tar.xz
mv Qogir/ $PREFIX/share/themes/
rm Qogir-Dark
rm Qogir-Light

#Install Fluent Cursor Icon Theme
wget https://github.com/vinceliuice/Fluent-icon-theme/archive/refs/tags/2023-02-01.zip
unzip 2023-02-01.zip
mv Fluent-icon-theme-2023-02-01/cursors/dist $PREFIX/share/icons/ 
mv Fluent-icon-theme-2023-02-01/cursors/dist-dark $PREFIX/share/icons/
rm -rf $HOME//Fluent*
rm 2023-02-01.zip

#Setup Fancybash Termux
#wget https://raw.githubusercontent.com/wahyu22010/Debian/main/fancybash.sh
#mv fancybash.sh .fancybash.sh
#echo "source $HOME/.fancybash.sh" >> $PREFIX/etc/bash.bashrc
#sed -i "326s/\\\u/$username/" $HOME/.fancybash.sh
#sed -i "327s/\\\h/termux/" $HOME/.fancybash.sh

#Autostart Conky
wget https://github.com/wahyu22010/Debian/raw/main/config.tar.gz
tar -xvzf config.tar.gz
rm config.tar.gz
chmod +x .config/autostart/conky.desktop

