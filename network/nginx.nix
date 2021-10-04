{ config, pkgs, ... }:

let content = import /home/matilde/projects/diffyq;
in {
  services.nginx = {
    enable = true;
    virtualHosts."diffyq.xyz".root = "${content}";
  };
}
