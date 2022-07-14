#!/bin/zsh

local nixhs="${HOME}/.nix-profile/etc/profile.d/nix.sh"

[ -f $nixhs ] && . $nixhs
