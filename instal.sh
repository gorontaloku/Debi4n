#!/bin/bash

# Unofficial Bash Strict Mode
set -euo pipefail
IFS=$'\n\t'

finish() {
  local ret=$?
  if [ ${ret} -ne 0 ] && [ ${ret} -ne 130 ]; then
    echo
    echo "ERROR: Failed to setup DEBIAN on Termux."
    echo "Please refer to the error message(s) above"
  fi
}

trap finish EXIT

clear

echo ""
echo "Ini Adalah Script Install Debian Di Termux"
echo "Hati-Hati Dalam Penggunaan Script Ini"
echo " Developer  : Bestmomen "
echo " My Number  : 082311123196 "
echo ""
#read -r -p "Please enter username for debian installation: " username </dev/tty

termux-change-repo
pkg update -y 
pkg upgrade -y 
sed -i '12s/^#//' $HOME/.termux/termux.properties

# Display a message 
clear -x
echo ""
echo "Setting up Termux Storage Access." 
# Wait for a single character input 
echo ""
read -n 1 -s -r -p "Press any key to continue..."
termux-setup-storage

# Set the correct password here
correct_password="25"

# Function to prompt for password
prompt_for_password() {
    echo "Enter the username:"
    read -s entered_password  # Read password input silently
}

# Main logic
while true; do
    prompt_for_password

    if [[ "$entered_password" == "$correct_password" ]]; then
        echo "Correct password entered. Access granted!"
        break  # Exit the loop if correct password is entered
    else
        echo "Incorrect password. Please try again."
    fi
done

clear

pkgs=( 'wget' 'file' 'dbus' 'x11-repo' 'tur-repo' 'android-tools' 'zsh' 'git' 'pulseaudio' 'virglrenderer-android' 'proot-distro')
pkg uninstall dbus -y
pkg update
pkg install "${pkgs[@]}" -y -o Dpkg::Options::="--force-confold"

#Create default directories
mkdir -p Desktop
mkdir -p Downloads

mkdir -p $PREFIX/var/lib/proot-distro
mkdir -p $PREFIX/var/lib/proot-distro/installed-rootfs

#Download required install scripts
wget https://github.com/gorontaloku/Debi4n/raw/main/xfce.sh
wget https://github.com/gorontaloku/Debi4n/raw/main/root.sh
wget https://github.com/gorontaloku/Debi4n/raw/main/utils.sh
chmod +x *.sh

./xfce.sh "$username"
./root.sh "$username"
./utils.sh



# Display a message 
clear -x
echo ""
echo "Pastikan Internet Berjalan Dengan Baik "
echo "Downloading Termux-X11" 
# Unduh termux x11
wget https://github.com/termux/termux-x11/releases/download/nightly/app-arm64-v8a-debug.apk
mv app-arm64-v8a-debug.apk $HOME/storage/downloads/

source $PREFIX/etc/bash.bashrc
termux-reload-settings

clear -x
echo ""
echo "Instalasi Telah Selesai!"
echo "Jangan Pernah Mencoba Untuk Instalasi Mandiri Tanpa Pengawasan Saya"
echo "BESTMOMEN"
echo ""

rm xfce.sh
rm root.sh
rm utils.sh
rm instal.sh
