#!/bin/bash

set -e # Exit on error

echo 'Updating system...'
sudo dnf update -y
sudo dnf upgrade -y

echo 'Installing zhs, kitty, omz...'
sudo dnf install zsh -y
sudo dnf install kitty -y

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install snapd
echo 'Installing snapd...'
sudo dnf install -y snapd

# Enable and start snapd service
echo "Enabling and starting snapd service..."
sudo systemctl enable --now snapd.socket

sudo ln -s /var/lib/snapd/snap /snap
echo 'Installation complete!'

# Ensure snap is ready before installing packages
echo "Waiting for snapd to be ready..."
until snap list &>/dev/null; do
    echo "Snapd is not ready yet. Retrying in 5 seconds..."
    sleep 5
done

echo 'Installing vscode...'
sudo snap install code --classic
echo 'Installation complete!'

# install nvim
echo 'Installing neovim via snap...'
sudo snap install nvim --classic
echo 'Succesfully installed!'

# install npm
echo 'Installing node via snap...'
sudo snap install node --classic
echo 'Succesfully installed!'

# install docker
echo 'Installing docker via snap...'
sudo snap install docker
# setting docker as user
 #sudo addgroup --system docker
 #sudo adduser $USER docker
 #newgrp docker
 #sudo snap disable docker
 #sudo snap enable docker
echo 'Succesfully installed!'

# Check if git is installed
echo "Checking for Git installation..."
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    sudo dnf install -y git
else
    echo "Git is already installed."
fi

# Define repository and destination
REPO_URL="https://github.com/publiusvergilius/default-settings.git"
DEST_DIR="$HOME/.config/default-settings"

# Clone the repository
echo "Cloning repository..."
git clone "$REPO_URL" "$DEST_DIR"

# Move configuration files
echo "Moving configuration files to ~/.config..."
mkdir -p "$HOME/.config"
cp -r "$DEST_DIR"/* "$HOME/.config/"

# Cleanup
echo "Cleaning up..."
rm -rf "$DEST_DIR"

echo "Dotfiles setup complete!"

