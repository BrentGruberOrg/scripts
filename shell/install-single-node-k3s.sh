#!/bin/sh

MASTER_IP=$(tailscale ip -4)

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-backend=none --node-ip=$MASTER_IP --node-external-ip=$MASTER_IP --bind-address=$MASTER_IP --disable servicelb --disable traefik" sh -
