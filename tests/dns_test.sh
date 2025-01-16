#!/bin/bash -x
#
# USAGE: ./sol.sh 192.168.56.103
#

# Salir si algún comando falla
set -euo pipefail

function resolver () {
    dig $nameserver +short $@
}

nameserver=@$1

resolver mercurio.sistema.sol
resolver venus.sistema.
resolver tierra.sistema.sol
resolver marte.sistema.sol



resolver -x 192.168.56.101
resolver -x 192.168.56.102
resolver -x 192.168.56.103
resolver -x 192.168.56.104