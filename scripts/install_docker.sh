#!/bin/bash
apt-get update
apt-get install -y docker.io docker-compose

# Start Docker and enable it to start at boot
sudo systemctl start docker
sudo systemctl enable docker
