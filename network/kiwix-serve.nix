{ config, pkgs, ... }:

with pkgs;
let
  kiwix-tools = fetchTarball {
    url =
      "https://mirror.download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-x86_64-3.1.2-5.tar.gz";
    sha256 = "171mzkdw6b9v76n17y2a6k4hsjn3c78zf8brk9wz7n8lcc37dw1s";
  };
in {
  systemd.services.kiwix-serve = {
    description = "Kiwix-Serve";

    script = ''
      ${kiwix-tools}/kiwix-serve -p 42069 $(find /data/kiwix.org -name '*.zim')
    '';

    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
  };
}
