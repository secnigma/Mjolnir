#!/bin/bash
## pm2ByNvm.sh
## Author: SecNigma
#
## Abstract:
# This script installs and configures NVM, NodeJS, NPM and PM2 , for low privileged users
# Since this uses NVM, NO ROOT PRIVILEGE IS REQUIRED!
#
#
# Usage:
# As low privileged user, you can issue the following oneliner for quick install.
# Fair Warning: Do your research, before curl-ing random scripts you've found online into bash
#
# curl -L  https://ishortn.ink/pm2bynvm |bash


NODE_VERSION="18.17"
NVM_INSTALLER_SCRIPT_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"




unset NVM_{DIR,BIN,INC}
curl -o- ${NVM_INSTALLER_SCRIPT_URL} | bash


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
nvm use $NODE_VERSION
node --version



echo $PATH
source ~/.bashrc

npm install pm2@latest -g
ln -s $HOME/.nvm/node_modules/pm2/bin/pm2 $(npm config get prefix)/bin/pm2
pm2 status


