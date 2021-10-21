{ config, pkgs, ... }:

with pkgs;
let
  image = dockerTools.pullImage {
    imageName = "escomp/cesm-2.2";
    finalImageTag = "latest";

    imageDigest =
      "sha256:a582ae55282ea15113f8e27101cf5bf391be7d84ac410bdb61043f61dce16cce";
    sha256 = "1lk673kvhbx91l3g9xiasnyfffq8l00hxvjwz3623312x0wvhxbi";
  };
in {
  virtualisation.docker.enable = true;

  systemd.services.cesm-image-loader = {
    description = "CESM2.2 image loader";

    script = ''
      ${docker}/bin/docker load < ${image}
    '';

    serviceConfig.Type = "oneshot";
    after = [ "docker.service" "network.target" ];
    wantedBy = [ "multi-user.target" ];
  };

  users.users.matilde.extraGroups = [ "docker" ];
}
