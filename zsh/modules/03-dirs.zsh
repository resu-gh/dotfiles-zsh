#!/bin/zsh

setopt AUTO_CD

# automatic ls after autocd
chpwd() {
    emulate -L zsh
    exa -as type
}
