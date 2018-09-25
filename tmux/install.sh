#!/usr/bin/env bash
source ./script/utils.sh

e_header "Trying to configure tmux..."

CWD=$(pwd)
ln -sf ${CWD}/tmux/tmux.conf ~/.tmux.conf

brew install ruby

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

gem install tmuxinator --silent

if [ $? -ne 0 ]; then
    e_error "Configuration failed!"
    exit 1
fi
e_success "Success."
