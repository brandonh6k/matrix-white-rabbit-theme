# Contributing to White Rabbit Theme Ecosystem

Thank you for your interest in contributing to the White Rabbit Theme Ecosystem! This document provides guidelines for contributing to this project.

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment for everyone.

## How to Contribute

There are many ways to contribute to this project:

1. **Report Bugs**: If you find a bug, please create an issue describing:
   - What happened vs. what you expected to happen
   - Steps to reproduce the issue
   - Your environment (OS, VS Code version, etc.)

2. **Suggest Enhancements**: Have ideas for improvements? Submit an issue with:
   - A clear description of the enhancement
   - Why it would be valuable
   - Any implementation ideas you have

3. **Submit Pull Requests**: Want to fix bugs or add features? Great! Follow these steps:
   - Fork the repository
   - Create a new branch for your changes
   - Make your changes
   - Submit a pull request with a clear description of what you've done

## Development Guidelines

### Working on the VS Code Theme

1. Make changes to `vscode-theme/themes/WhiteRabbitDark-color-theme.json`
2. Install the theme locally using `vscode-theme/install.sh`
3. Test your changes in VS Code

### Working on the Starship Prompt

1. Make changes to `starship/starship.toml`
2. Test your changes by copying to `~/.config/starship.toml`
3. Restart your terminal or run `source ~/.zshrc` (or equivalent)

### Working on Terminal Colors

1. Make changes to `terminal/white-rabbit-terminal-colors.sh`
2. Test by sourcing the file: `source terminal/white-rabbit-terminal-colors.sh`

## Style Guidelines

### Color Palette

Stay within the Matrix-inspired color palette:

- Primary: `#00FF41` (neon green)
- Background: `#000000` (black)
- Foreground: `#8fd7b9` (light teal)

### Documentation

- Keep documentation up to date with changes
- Use clear, concise language
- Include examples where helpful

## Pull Request Process

1. Update the README.md and other documentation with details of changes if appropriate
2. Update the version number in relevant files following [SemVer](http://semver.org/)
3. The PR will be merged once it has been reviewed and approved

## Questions?

If you have any questions about contributing, feel free to open an issue asking for clarification.

Thank you for your contributions to make the White Rabbit Theme Ecosystem better for everyone!
