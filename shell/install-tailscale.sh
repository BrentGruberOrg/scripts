#!/bin/sh

# Add the tailscale signing key and repository
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/jammy.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list


# Install tailscale
sudo apt-get update && sudo apt-get install -y tailscale

# Create systemd file for tailscale
# By using doppler to start the service, the tailscale token
# can be rotated in doppler without having to touch the servers
# it also allows this script to be stored in git :)
cat <<EOF >/lib/systemd/system/tailscale.service
[Unit]
Description=Tailscale client
After=tailscale.service

[Service]
LimitMEMLOCK=infinity
User=root
Group=root
Type=simple
ExecStart=doppler run --command 'sudo /usr/local/bin/tailscale up -authkey $TAILSCALE_TOKEN'
ExecStopPost=/usr/local/bin/tailscale down
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF


# enable and start the service
sudo systemctl daemon-reload
sudo systemctl enable tailscale.service --now
