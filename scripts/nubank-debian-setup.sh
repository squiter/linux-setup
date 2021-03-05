#!/bin/bash

echo "Yubikey setup"
sudo add-apt-repository ppa:yubico/stable && sudo apt-get update
sudo apt-get install yubikey-manager-qt

echo "Nucli prerequired items"
sudo apt-get install openjdk-8-jdk virtualbox git curl python-pip libnss3-tools npm

sudo snap install --edge jq-core20
sudo snap alias jq-core20.jq jq

pip install awscli --user

curl https://get.docker.com | bash

echo "Nucli setup"
cd ~
mkdir dev
mkdir dev/nu
cd dev/nu
git clone git@github.com:nubank/nudev.git
cd nudev
./setupnu.sh

echo "Installing LinuxBrew"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

brew install fzf
brew install tldr
brew install clj-kondo
brew install navi
brew install openfortivpn

echo "If you have any problems with certificates, you can run: "
echo "'git checkout 3cfbf9f4c45ab39d1f78bd7927286b7f46cbd802' at nucli"
echo "and try the ./setupnu.sh again"

