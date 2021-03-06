{ config, pkgs, ... }:

{
  services = {
    yggdrasil = {
      enable = true;

      config = {
        Peers = [
          "tcp://213.188.199.150:10010"
          "tcp://213.188.210.9:10010"
          "tcp://50.236.201.218:56088"
        ];

        IfName = "ygg0";
      };

      configFile = /nix/persist/yggdrasil.json; # Secret keys!
    };

    i2pd = {
      enable = true;

      proto = {
        http.enable = true;
        httpProxy.enable = true;
      };
    };

    tor.enable = true;
  };
}
