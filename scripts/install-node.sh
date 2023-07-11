#!/bin/bash

OS=$(awk -F= '/^ID=/ {gsub(/"/, "", $2); print tolower($2)}' /etc/os-release)
NODE_VERSION=${NODE_VERSION:-18.16.1}
FORCE=${FORCE:-false}
NVM_VERSION=${NVM_VERSION:-v0.39.3}

if [ "$FORCE" = "true" ]; then
    echo "Force install nodejs"
    rm -rf ~/.nvm
fi

if [ "$OS" = "alpine" ]; then
    export NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release
    NVM_DIR="$HOME/.nvm"
    echo 'nvm_get_arch() { nvm_echo "x64-musl"; }' >> ~/.profile
    source .profile
fi

PROFILE=/dev/null curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
# source "$HOME/.nvm/nvm.sh"
# nvm install $NODE_VERSION
