#!/bin/sh

## Pre-Requisites
#  - doppler cli

# Curl the install script and run it with doppler secrets
doppler run --command 'ARCH=$(dpkg --print-architecture) bash <(curl -Ls https://raw.githubusercontent.com/BrentGruberOrg/install-grafana-agent/main/grafanacloud-install.sh)'
