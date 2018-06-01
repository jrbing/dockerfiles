#!/bin/bash
#===============================================================================
# vim: softtabstop=2 shiftwidth=2 expandtab fenc=utf-8 spelllang=en ft=sh
#===============================================================================
#
#          FILE: docker-entrypoint.sh
#
#         USAGE: ./docker-entrypoint.sh
#
#   DESCRIPTION: Start the zerotier client
#
#===============================================================================

set -e          # Exit immediately on error
set -u          # Treat unset variables as an error
set -o pipefail # Prevent errors in a pipeline from being masked

if [[ ! -e /dev/net/tun ]]; then
  echo 'FATAL: cannot start ZeroTier One in container: /dev/net/tun not present.'
  exit 1
fi

function echoinfo() {
  local GC="\033[1;32m"
  local EC="\033[0m"
  printf "${GC} ☆  INFO${EC}: %s\n" "$@";
}

function create_tun_device() {
  echoinfo "Creating tunnel device"
  mkdir -p /dev/net
  mknod /dev/net/tun c 10 200
  chmod 600 /dev/net/tun
}

function join_zerotier_network() {
  echoinfo "Joining zerotier network $NETWORK"
  /usr/sbin/zerotier-cli join "$NETWORK"
}

function start_zerotier() {
  echoinfo "Starting zerotier daemon"
  /usr/sbin/zerotier-one
}

#create_tun_device
#join_zerotier_network
start_zerotier
