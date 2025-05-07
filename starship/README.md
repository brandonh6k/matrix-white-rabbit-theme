# White Rabbit Starship Prompt

A Matrix-inspired [Starship](https://starship.rs/) prompt configuration with neon green aesthetics.

## Overview

This Starship preset provides:

- Matrix-inspired green color scheme
- Custom styling for directories, Git status, and language versions
- Enhanced developer experience with informative, visually distinct prompt segments
- Perfect integration with the White Rabbit terminal and VS Code themes

## Preview

[Add screenshot here after installing]

## Installation

### Prerequisites

- [Starship](https://starship.rs/) installed on your system

If you haven't installed Starship yet:
```bash
# macOS
brew install starship

# Linux
curl -sS https://starship.rs/install.sh | sh
```

### Setup

1. Ensure Starship is in your shell initialization file:

   For Zsh (in `~/.zshrc`):
   ```bash
   eval "$(starship init zsh)"
   ```

   For Bash (in `~/.bashrc`):
   ```bash
   eval "$(starship init bash)"
   ```

2. Copy the Starship configuration:
   ```bash
   cp ./starship.toml ~/.config/
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.zshrc  # or source ~/.bashrc if using Bash
   ```

## Features

This Starship configuration includes:

- Custom formatting for directory paths
- Git branch and status indicators
- Package version information
- Programming language version indicators (Node.js, Python, Rust, Go)
- Command duration tracking
- AWS profile indication
- Custom color palette based on the White Rabbit theme

## Color Palette

The configuration uses the following Matrix-inspired color palette:

- Primary: `#00FF41` (neon green)
- Background: `#000000` (black)
- Foreground: `#8fd7b9` (light teal)

Plus various shades of green for different prompt elements.

## Customization

To modify the configuration:

1. Edit `~/.config/starship.toml`
2. Change colors, symbols, or formats to your liking
3. Save the file and restart your terminal

See the [Starship documentation](https://starship.rs/config/) for more configuration options.

## Integration with White Rabbit Ecosystem

This Starship configuration is part of the White Rabbit Theme Ecosystem, which includes:

- White Rabbit Starship Prompt (this package)
- White Rabbit Dark VS Code Theme
- White Rabbit Terminal Colors

For the complete Matrix experience, install all components by following the [Complete Installation Guide](../INSTALLATION.md).

## License

MIT License
