#!/bin/bash

UNATTENDED=${UNATTENDED:-false}
FORCE=${FORCE:-false}
NODE_VERSION=${NODE_VERSION:-18.16.1}
VOLTA_DIR="$HOME/.volta"

if [ "$OS" = "alpine" ]; then
    echo "export NVM_NODEJS_ORG_MIRROR=https://unofficial-builds.nodejs.org/download/release" >> .profile
    nvm_get_arch() { nvm_echo \"x64-musl\"; }
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
