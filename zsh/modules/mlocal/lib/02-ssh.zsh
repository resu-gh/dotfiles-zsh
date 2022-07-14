#!/bin/zsh

privkeys=(
    # private keys
)


[[ -z "$SSH_AUTH_SOCK" ]] && {
    eval `ssh-agent -s`
    for i ("$privkeys[@]") ssh-add $i
}
