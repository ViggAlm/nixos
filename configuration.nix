{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./boot/boot.nix
      ./boot/secureboot.nix
      ./modules/networking.nix
      ./modules/gnome.nix
#      ./modules/hyprland.nix
    ];
    
  # Experimental Nix features
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System timezone and console settings
  time.timeZone = "Europe/Stockholm";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "sv-latin1";
  };

  # Define user accounts
  users.users.viggo = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System packages
  environment.systemPackages = with pkgs; [
    vim
    fastfetch
    firefox
    sbctl
    niv
    spotify
    git
    neofetch
    conky
    unzip
    obsidian
  ];
  
  # Enable automatic system cleanup
  systemd.timers.nix-gc = {
    enable = true;
    timerConfig = {
      OnCalendar = "weekly";
      Persistent = true;
    };
  };

  # System version
  system.stateVersion = "24.11"; # Do not change!
}
