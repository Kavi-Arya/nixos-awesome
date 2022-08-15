#!/bin/bash

echo "## Cloneing and Installing ##"
clones ()
{
  mkdir $HOME/.clones
}

echo "## Moving ##"
mving ()
{
  cp -r $HOME/.clones/nixos-awesome/awesome $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/kitty $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/zsh $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/myStartpage $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/x11 $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/picom.config $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/neofetch $HOME/.config/
  cp -r $HOME/.clones/nixos-awesome/.zprofile $HOME
  cp -r $HOME/.clones/nixos-awesome/themes-wm $HOME
  cp -r $HOME/.clones/nixos-awesome/"#FILENAMEHOLDER" $HOME

  # DIR="$HOME/.local/share/fonts"
  if [ -d "$DIR" ]; then
    cp -r $HOME/.clones/nixos-awesome/fonts/* $HOME/.local/share/fonts
  else
    cp -r $HOME/.clones/nixos-awesome/fonts/ $HOME/.local/share/
  fi
} 

echo "## Nixos-config ##"
config_nixos ()
{
  sudo rm -rf /etc/nixos/configuration.nix
  cp -r $HOME/.clones/nixos-awesome/configuration.nix /etc/nixos/configuration.nix
  sudo nixos-rebuild switch 
}
