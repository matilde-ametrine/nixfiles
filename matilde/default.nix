{ config, pkgs, ... }:

{
  imports = [ ./state.nix ];

  users = {
    mutableUsers = false;

    users.matilde = {
      description = "Matilde H. Ametrine";
      isNormalUser = true;
      uid = 1000;
      group = "wheel";
      shell = pkgs.zsh;

      initialHashedPassword =
        "$6$Ld/MelJM$.2DDXEgnCgC8/G.3z56l3HKNygs.p65hJShmyq.J/J2XcSzmeMWSLbIRS6q2QWaVxve0ID7vGgLXLG1zffbW70";
    };
  };
}
