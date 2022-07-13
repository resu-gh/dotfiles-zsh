#!/bin/zsh

() {
    local module=
    for module in $ZDOTDIR/modules/<->-*.zsh(n); do
        . $module
    done

    local mtarget=
    for mtarget in $ZDOTDIR/modules/mtarget/<->-*.zsh(n); do
        . $mtarget
    done

    local mlocal=
    for mlocal in $ZDOTDIR/modules/mlocal/<->-*.zsh(n); do
        . $mlocal
    done
} "$@"
