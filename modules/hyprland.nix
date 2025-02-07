{ config, lib, pkgs, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.rofi
    pkgs.waybar
    pkgs.hyprpaper
    pkgs.hyprland.hyprbars
  ];
  
  fonts = {
    enableFontDir = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];
  };
}
