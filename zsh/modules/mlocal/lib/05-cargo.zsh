#!/bin/zsh

local cargobin="$HOME/.cargo/bin"

[ -d $cargobin ] && {
    path+=("$cargobin")
    export PATH
}
