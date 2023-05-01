{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> {};
in
{
  environment.systemPackages = with pkgs; [
    unstable.obsidian
    unstable.neovim
    unstable.syncthing
    unstable.armcord
    unstable.spotify
    unstable.firefox
    unstable.kitty
    unstable.fish
    unstable.oh-my-fish
    lxappearance
    lxappearance-gtk2
    gamemode
    steam
    steam-tui
    steamPackages.steamcmd
    pavucontrol
    flameshot
    feh
    git
    curl
    wget
  ];
}

