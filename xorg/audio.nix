{ config, pkgs, ... }:

{
  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = true;

      extraConfig = ''
        .ifexists module-bluetooth-policy.so
          load-module module-bluetooth-policy auto_switch=false
        .endif

        .ifexists module-bluetooth-discover.so
          load-module module-bluetooth-discover
          load-module module-switch-on-connect
        .endif
      '';
    };
  };

  nixpkgs.config.pulseaudio = true;

  users.users.matilde.extraGroups = [ "audio" ];
}
