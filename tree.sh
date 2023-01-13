#!/usr/bin/env nix-shell
#!nix-shell -p zsh tree -i zsh

tree -CI 'secrets|tree.sh' --dirsfirst --noreport $(dirname $0) | tail -n +2
