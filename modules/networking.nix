{ config, lib, pkgs, ... }:

{
  # Hostname configuration
  networking.hostName = "nixos";

  # Enable NetworkManager for managing network connections
  networking.networkmanager.enable = true;

  # Firewall configuration
  networking.firewall = {
    enable = true;  # Enable the firewall
    allowedTCPPorts = [
      80   # Allow HTTP
      443  # Allow HTTPS
    ];
    allowedUDPPorts = [];
  };
}
