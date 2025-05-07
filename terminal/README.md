# White Rabbit Terminal Colors

Matrix-inspired terminal colors for your shell and command outputs.

## Overview

This component provides custom color configurations for various terminal commands and tools:

- Custom colors for `ls` output
- Colorized `grep` output in Matrix green
- Styled man pages with green highlighting
- Enhanced tree command output
- Support for both macOS default `ls` and GNU `ls`
- Optional support for `exa` as an enhanced `ls` replacement

## Installation

### Shell Configuration

1. Copy the terminal colors configuration:
   ```bash
   cp ./white-rabbit-terminal-colors.sh ~/.config/
   ```

2. Add the following line to your shell configuration file (`.zshrc` or `.bashrc`):
   ```bash
   source "$HOME/.config/white-rabbit-terminal-colors.sh"
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc if using Bash
   ```

### VS Code Integration

To apply the White Rabbit theme colors to your VS Code terminal:

1. Open VS Code Settings (JSON):
   - Press `Cmd+Shift+P` (or `Ctrl+Shift+P` on Windows/Linux)
   - Type "Open Settings (JSON)" and select it

2. Add the contents of `white-rabbit-vscode-settings.json` to your settings.json file.

If you already have "workbench.colorCustomizations" entries in your settings.json, incorporate the terminal-specific entries from this file into your existing configuration.

## Color Palette

This terminal theme uses the following Matrix-inspired color palette:

- Primary: `#00FF41` (neon green)
- Background: `#000000` (black)
- Foreground: `#8fd7b9` (light teal)

Terminal Colors:
```
bright:
  black: '#00E64D'
  red: '#00FF41'
  green: '#33FF33'
  yellow: '#5CFF5C'
  blue: '#7FFF7F'
  magenta: '#A3FFA3'
  cyan: '#CCFFCC'
  white: '#E6FFE6'
normal:
  black: '#001A0E'
  red: '#003D1A'
  green: '#005F0F'
  yellow: '#007A1F'
  blue: '#008F11'
  magenta: '#00A321'
  cyan: '#00B733'
  white: '#00CC44'
```

## Customization

You can customize the colors in `white-rabbit-terminal-colors.sh` to better fit your preferences. The file is well-commented to help you understand what each section controls.

## Integration with White Rabbit Ecosystem

This terminal configuration is part of the White Rabbit Theme Ecosystem, which includes:

- White Rabbit Terminal Colors (this package)
- White Rabbit Dark VS Code Theme
- White Rabbit Starship Prompt

For the complete Matrix experience, install all components by following the [Complete Installation Guide](../INSTALLATION.md).

## License

MIT License
