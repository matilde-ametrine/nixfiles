{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, hyprland }: {
    nixosConfigurations = with nixpkgs.lib;
      genAttrs (builtins.attrNames (builtins.readDir ./machines)) (name:
        nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./machines/default.nix
            (./machines + "/${name}")
            hyprland.nixosModules.default
          ];
        });
  };
}
