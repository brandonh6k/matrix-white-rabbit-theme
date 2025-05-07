# White Rabbit Theme Ecosystem - File Structure

This document explains the organization of this repository to help you navigate and understand its components.

```
matrix-white-rabbit-theme/          # Root directory
│
├── install.sh                      # Master installation script for all components
├── INSTALLATION.md                 # Complete installation guide
├── README.md                       # Project overview and description
│
├── screenshots/                    # Visual examples of the theme components
│   └── README.md                   # Instructions for screenshots
│
├── starship/                       # Starship prompt configuration
│   ├── README.md                   # Starship component documentation
│   └── starship.toml               # Starship configuration file
│
├── terminal/                       # Terminal color configurations
│   ├── README.md                   # Terminal component documentation
│   ├── white-rabbit-terminal-colors.sh      # Shell script for terminal colors
│   └── white-rabbit-vscode-settings.json    # VS Code terminal color settings
│
└── vscode-theme/                  # VS Code editor theme
    ├── install.sh                 # VS Code theme installation script
    ├── package.json               # VS Code extension metadata
    ├── README.md                  # VS Code theme documentation
    └── themes/                    # Theme definition files
        └── WhiteRabbitDark-color-theme.json  # Theme color definitions
```

## Component Overview

### Installation Files

- `install.sh`: The main installation script that installs all components
- `INSTALLATION.md`: Detailed instructions for manual installation of each component
- `README.md`: General project overview and documentation

### Starship Component

- `starship/starship.toml`: Configuration file for the Starship prompt with Matrix-inspired colors
- `starship/README.md`: Documentation specific to the Starship prompt component

### Terminal Colors Component

- `terminal/white-rabbit-terminal-colors.sh`: Shell script that configures colors for terminal commands
- `terminal/white-rabbit-vscode-settings.json`: VS Code settings for terminal colors
- `terminal/README.md`: Documentation for the terminal colors component

### VS Code Theme Component

- `vscode-theme/themes/WhiteRabbitDark-color-theme.json`: The theme definition file with all color values
- `vscode-theme/package.json`: Metadata required for VS Code extension functionality
- `vscode-theme/install.sh`: Installation script specific to the VS Code theme
- `vscode-theme/README.md`: Documentation specific to the VS Code theme component

### Screenshots

- `screenshots/`: Directory containing visual examples of the theme in action
- `screenshots/README.md`: Instructions for what screenshots to include
