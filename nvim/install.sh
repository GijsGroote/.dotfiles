#!/usr/bin/sh

# install configuration files by executing the following line in the terminal (without the "#"): 
# source ./install.sh 


NVIM_CONFIG_PATH=~/.config/
export NVIM_CONFIG_PATH

rm -rf $NVIM_CONFIG_PATH

mkdir -p $NVIM_CONFIG_PATH/share
mkdir -p $NVIM_CONFIG_PATH/nvim

stow --restow --target=$NVIM_CONFIG_PATH/nvim .

   
