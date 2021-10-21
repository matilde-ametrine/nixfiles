{ config, pkgs, ... }:

let content = import /data/3.software/1.github/matilde-ametrine/diffyq;
in {
  services.nginx = {
    enable = true;
    virtualHosts."diffyq.xyz".root = "${content}";
  };
}
