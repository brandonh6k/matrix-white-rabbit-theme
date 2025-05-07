#!/bin/zsh

# White Rabbit Theme Installer for VS Code

echo "Installing White Rabbit Dark Theme for VS Code..."

# Define the extension directory path for VS Code
VSCODE_EXTENSIONS_DIR="$HOME/.vscode/extensions"
VSCODE_INSIDERS_EXTENSIONS_DIR="$HOME/.vscode-insiders/extensions"

# Define the theme directory name (will be used to create folder)
THEME_DIR_NAME="white-rabbit-theme-0.0.1"

# Create the target directories if they don't exist
mkdir -p "$VSCODE_EXTENSIONS_DIR"
mkdir -p "$VSCODE_INSIDERS_EXTENSIONS_DIR"

# Check if theme is already installed and remove it
if [ -d "$VSCODE_EXTENSIONS_DIR/$THEME_DIR_NAME" ]; then
    echo "Removing previous installation from VS Code..."
    rm -rf "$VSCODE_EXTENSIONS_DIR/$THEME_DIR_NAME"
fi

if [ -d "$VSCODE_INSIDERS_EXTENSIONS_DIR/$THEME_DIR_NAME" ]; then
    echo "Removing previous installation from VS Code Insiders..."
    rm -rf "$VSCODE_INSIDERS_EXTENSIONS_DIR/$THEME_DIR_NAME"
fi

# Copy the theme to VS Code extensions directory
echo "Installing theme for VS Code..."
cp -r "$(dirname "$0")" "$VSCODE_EXTENSIONS_DIR/$THEME_DIR_NAME"

# Copy the theme to VS Code Insiders extensions directory
echo "Installing theme for VS Code Insiders..."
cp -r "$(dirname "$0")" "$VSCODE_INSIDERS_EXTENSIONS_DIR/$THEME_DIR_NAME"

echo "Installation complete!"
echo ""
echo "To activate the theme:"
echo "1. Restart VS Code (if it's running)"
echo "2. Press Cmd+Shift+P and type 'Color Theme'"
echo "3. Select 'White Rabbit Dark' from the list"
echo ""
echo "Follow the white rabbit. 🐇"
