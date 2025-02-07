{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    excludePackages = [ pkgs.xterm ];
  };

  environment.gnome.excludePackages = with pkgs; [
    orca
    evince
    geary
    gnome-disk-utility
    seahorse
    sysprof
    gnome-backgrounds
    gnome-color-manager
    gnome-tour
    gnome-user-docs
    baobab
    epiphany
    gnome-calendar
    gnome-characters
    gnome-clocks
    gnome-contacts
    gnome-font-viewer
    gnome-logs
    gnome-maps
    gnome-music
    gnome-system-monitor
    gnome-weather
    gnome-connections
    simple-scan
    snapshot
    yelp
    gnome-software
    gnome-text-editor
  ];

  environment.systemPackages = with pkgs; [
    gnome-tweaks
  ];
}
