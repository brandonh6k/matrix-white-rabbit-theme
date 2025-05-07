#!/bin/zsh

# White Rabbit Theme Ecosystem Installer
# This script installs all components of the White Rabbit Theme ecosystem:
# - VS Code theme
# - Terminal colors
# - Starship prompt configuration

echo "🐇 Follow the White Rabbit - Theme Ecosystem Installer 🐇"
echo "========================================================"
echo ""

# Define colors for output
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RESET='\033[0m'

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
CONFIG_DIR="$HOME/.config"

# Create config directory if it doesn't exist
if [ ! -d "$CONFIG_DIR" ]; then
    echo -e "${CYAN}Creating config directory...${RESET}"
    mkdir -p "$CONFIG_DIR"
fi

# Install VS Code Theme
echo -e "${GREEN}Installing White Rabbit Dark Theme for VS Code...${RESET}"
zsh "$SCRIPT_DIR/vscode-theme/install.sh"
echo ""

# Install Terminal Colors
echo -e "${GREEN}Installing White Rabbit Terminal Colors...${RESET}"
cp "$SCRIPT_DIR/terminal/white-rabbit-terminal-colors.sh" "$CONFIG_DIR/"

# Add to shell config if not already there
if ! grep -q "source.*white-rabbit-terminal-colors.sh" ~/.zshrc; then
    echo -e "${CYAN}Adding terminal colors to .zshrc...${RESET}"
    echo '' >> ~/.zshrc
    echo '# White Rabbit Terminal Colors' >> ~/.zshrc
    echo 'source "$HOME/.config/white-rabbit-terminal-colors.sh"' >> ~/.zshrc
    echo "Terminal colors configuration added to .zshrc"
else
    echo "Terminal colors already configured in .zshrc"
fi

echo ""

# Install Starship Prompt
echo -e "${GREEN}Installing White Rabbit Starship Prompt...${RESET}"

# Check if Starship is installed
if ! command -v starship &> /dev/null; then
    echo -e "${CYAN}Starship is not installed. Would you like to install it? (y/n)${RESET}"
    read -r install_starship
    
    if [[ $install_starship =~ ^[Yy]$ ]]; then
        echo "Installing Starship..."
        curl -sS https://starship.rs/install.sh | sh
    else
        echo "Skipping Starship installation. You'll need to install it manually to use the White Rabbit prompt."
    fi
fi

# Copy Starship configuration
cp "$SCRIPT_DIR/starship/starship.toml" "$CONFIG_DIR/"
echo "Starship configuration installed to ~/.config/starship.toml"

# Check if Starship is in shell config
if ! grep -q 'eval "$(starship init zsh)"' ~/.zshrc; then
    echo -e "${CYAN}Adding Starship initialization to .zshrc...${RESET}"
    echo '' >> ~/.zshrc
    echo '# Initialize Starship prompt' >> ~/.zshrc
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    echo "Starship initialization added to .zshrc"
else
    echo "Starship already configured in .zshrc"
fi

echo ""
echo -e "${GREEN}Installation Complete!${RESET}"
echo ""
echo "To see the changes:"
echo "1. Restart VS Code"
echo "2. Restart your terminal or run: source ~/.zshrc"
echo ""
echo "For more information, see:"
echo "- VS Code Theme: $SCRIPT_DIR/vscode-theme/README.md"
echo "- Terminal Colors: $SCRIPT_DIR/terminal/README.md"
echo "- Starship Prompt: $SCRIPT_DIR/starship/README.md"
echo ""
echo "Follow the white rabbit. 🐇"
