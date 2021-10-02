{ config, pkgs, ... }:

with pkgs; {
  environment.systemPackages = [
    nordic
    elementary-xfce-icon-theme
    xscreensaver

    xfce.xfce4-battery-plugin
    xfce.xfce4-clipman-plugin
  ];

  services.xserver = {
    desktopManager.xfce.enable = true;

    displayManager = {
      autoLogin = {
        enable = true;
        user = "matilde";
      };

      defaultSession = "xfce";
    };
  };
}
