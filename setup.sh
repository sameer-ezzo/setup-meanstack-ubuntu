#!/bin/bash

# Exit on error
set -e


# Function to check if a package is installed
package_installed() {
  sudo dpkg -l "$1" >/dev/null 2>&1
}

# Update package list and upgrade existing packages
sudo apt update
sudo apt upgrade -y
sudo apt-get install curl

# List of essential development tools and packages to install
packages_to_install="nano git build-essential libssl-dev zsh zsh-antigen fonts-firacode python3-dev python3-pip python3-setuptools thefuck"

# Install essential packages
for package in $packages_to_install; do
  if ! package_installed "$package"; then
    sudo apt-get install -y "$package"
  fi
done

# Clean up apt cache
sudo apt clean

# Create a directory for Zsh history
mkdir -p "$HOME/zsh_history"
touch "$HOME/zsh_history/.zsh_history"
chown -R "$(whoami)" "$HOME/zsh_history"

# Copy the Zsh configuration template
cp template.zshrc "$HOME/.zshrc"

# Change the default shell to Zsh
sudo chsh -s "$(which zsh)" "$(whoami)"


# Install NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
mkdir -p "$NVM_DIR"
sudo chown -R "$(whoami)" "$NVM_DIR"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
\. "$NVM_DIR/nvm.sh"
nvm install --lts --latest-npm

# Start Zsh
zsh
