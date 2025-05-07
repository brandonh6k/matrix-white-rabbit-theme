# Complete Installation Guide

This guide will walk you through installing the entire White Rabbit Theme ecosystem for a complete Matrix-inspired development environment.

## Prerequisites

- VS Code (or VS Code Insiders)
- Zsh or Bash shell
- [Starship prompt](https://starship.rs/) installed

## 1. Install the VS Code Theme

### Option 1: Manual Installation

1. Copy the `vscode-theme` folder to your VS Code extensions directory:
   - Windows: `%USERPROFILE%\.vscode\extensions\white-rabbit-theme-0.0.1`
   - macOS: `~/.vscode/extensions/white-rabbit-theme-0.0.1`
   - Linux: `~/.vscode/extensions/white-rabbit-theme-0.0.1`

2. Restart VS Code

3. Select the theme:
   - Open the Command Palette (`Cmd+Shift+P` or `Ctrl+Shift+P`)
   - Type "Preferences: Color Theme" and press Enter
   - Select "White Rabbit Dark" from the list

### Option 2: Using the Install Script

1. Run the installation script:
   ```bash
   ./vscode-theme/install.sh
   ```

2. Follow the on-screen instructions to complete the installation.

## 2. Configure Terminal Colors

### Option 1: Shell Configuration

1. Add the following line to your shell configuration file (`.zshrc` or `.bashrc`):
   ```bash
   source "$HOME/.config/white-rabbit-terminal-colors.sh"
   ```

2. Copy the terminal colors configuration:
   ```bash
   cp ./terminal/white-rabbit-terminal-colors.sh ~/.config/
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc if using Bash
   ```

### Option 2: VS Code Terminal Configuration

1. Open VS Code Settings (JSON):
   - Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows/Linux)
   - Type "Open Settings (JSON)" and select it

2. Add the terminal color customizations from `./terminal/white-rabbit-vscode-settings.json` to your settings.json file.

## 3. Install Starship Prompt Configuration

1. Ensure [Starship](https://starship.rs/) is installed:
   ```bash
   # If not installed, install Starship
   curl -sS https://starship.rs/install.sh | sh
   ```

2. Add Starship to your shell (if not already added):
   ```bash
   # For Zsh, add to ~/.zshrc
   echo 'eval "$(starship init zsh)"' >> ~/.zshrc
   
   # For Bash, add to ~/.bashrc
   echo 'eval "$(starship init bash)"' >> ~/.bashrc
   ```

3. Copy the Starship configuration:
   ```bash
   cp ./starship/starship.toml ~/.config/
   ```

4. Restart your terminal or run:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc if using Bash
   ```

## One-Click Installation

For a complete setup, you can use the all-in-one installer:

```bash
./install.sh
```

This will install all components and configure them automatically.

## Verifying Installation

After installation:

1. Open VS Code with the White Rabbit Dark theme
2. Open a terminal in VS Code - it should have the Matrix green colors
3. Navigate to a Git repository to see the customized Starship prompt

## Troubleshooting

If you encounter any issues during installation:

- Ensure all prerequisite tools are installed and up-to-date
- Check that file paths are correct for your system
- Verify that you have permission to write to the destination directories
- Make sure VS Code is closed during installation of the theme

For more detailed help, see the README.md in each component directory.

Follow the white rabbit. 🐇
