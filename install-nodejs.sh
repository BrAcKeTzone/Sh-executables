#!/bin/sh

# Update package list
echo "Updating package list..."
apk update

# Install Node.js LTS and npm
echo "Installing Node.js LTS and npm..."
apk add nodejs-lts npm

# Verify installation
echo "Installation complete. Verifying versions..."
node --version
npm --version

# Install some common global packages (optional)
echo "Installing some useful global npm packages..."
npm install -g npm@latest
npm install -g yarn

# Configure npm to use custom global directory (to avoid permission issues)
echo "Configuring npm global directory..."
mkdir -p ~/.npm-global
npm config set prefix ~/.npm-global

# Add npm global binary path to shell configuration
echo "Adding npm global binary path to shell configuration..."
echo 'export PATH=~/.npm-global/bin:$PATH' >> ~/.zshrc

# Final message
echo "Node.js LTS installation complete!"
echo "Please restart your shell or run: source ~/.zshrc"
