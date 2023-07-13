#!/bin/sh

# INSTALL some pre-reqs
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

# Download the signing key
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo gpg --dearmor -o /usr/share/keyrings/doppler-archive-keyring.gpg

# Add the doppler registry
echo "deb [signed-by=/usr/share/keyrings/doppler-archive-keyring.gpg] https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list


# Install the cli
sudo apt-get update && sudo apt-get install -y doppler


# Check the install
doppler --version
