#!/bin/sh

# Setup doppler based on the host name
# This does a root setup, so secrets will be available
# from any directory
doppler setup -p infrastructure -c linux_$(hostname)
