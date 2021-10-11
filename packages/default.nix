{ config, pkgs, lib, ... }:

{
  imports = [ ./python.nix ./cesm.nix ];

  environment.systemPackages = with pkgs; [
    any-nix-shell
    nix-index

    git
    git-crypt
    borgbackup

    psmisc
    htop
    file
    tree
    moreutils
    unzip

    direnv
    nix-diff
    nixfmt
    nixpkgs-fmt

    units
    clac
    rink
    pcalc
    dateutils

    weather
    (hiPrio parallel)
    netcdf
    nco
    cdo
    mitscheme

    samtools
    vcftools
    igv

    texlive.combined.scheme-full
    graphviz
    imagemagick

    man-pages
    nix-doc
  ];

  programs = {
    zsh.enable = true;
    command-not-found.enable = true;

    vim.defaultEditor = true;

    tmux.enable = true;
  };

  services.lorri.enable = true;
}
