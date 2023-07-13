#!/bin/sh

# NOTE: This script assumes that the doppler cli is already authenticated


# Setup doppler based on the host name
# This does a root setup, so secrets will be available
# from any directory
doppler setup -p infrastructure -c linux_$(hostname) --scope /
