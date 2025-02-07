{ config, pkgs, ... }:

{
  boot = {
    bootspec.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.luks.devices.cryptroot.device = "/dev/disk/by-uuid/UUID";
    initrd.verbose = false;
    consoleLogLevel = 0;
    
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "rings" ];
        })
      ];
    };
    
    loader = {
      systemd-boot.editor = false;
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    
    kernelParams = [
      "quiet"
      "splash"
      "vga=current"
      "rd.systemd.show_status=false"
    ];
    
    loader.timeout = 0;
  };
}
