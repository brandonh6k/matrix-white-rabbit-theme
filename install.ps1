# White Rabbit Theme Ecosystem Installer for Windows (PowerShell)
# This script installs all components of the White Rabbit Theme ecosystem:
# - VS Code theme
# - Terminal colors (via VS Code settings)
# - Starship prompt configuration

Write-Host "🐇 Follow the White Rabbit - Theme Ecosystem Installer (Windows) 🐇"
Write-Host "=================================================================="
Write-Host ""

# Define colors for output (approximated for PowerShell)
$ColorGreen = { Write-Host -ForegroundColor Green $args }
$ColorCyan = { Write-Host -ForegroundColor Cyan $args }
$ColorReset = { Write-Host -ForegroundColor Gray $args } # PowerShell doesn't have a direct "reset" like ANSI

# Get the directory where this script is located
$ScriptDir = $PSScriptRoot
$ConfigDir = "$env:USERPROFILE\.config"
$StarshipConfigPath = Join-Path $ConfigDir "starship.toml"

# Create config directory if it doesn't exist
if (-not (Test-Path $ConfigDir)) {
    &$ColorCyan "Creating config directory: $ConfigDir"
    New-Item -ItemType Directory -Path $ConfigDir -Force | Out-Null
}

# --- Install VS Code Theme ---
&$ColorGreen "Installing White Rabbit Dark Theme for VS Code..."

$VsCodeExtensionsDir = "$env:USERPROFILE\\.vscode\\extensions"
$VsCodeInsidersExtensionsDir = "$env:USERPROFILE\\.vscode-insiders\\extensions"

# Define ThemeSourceDir first as it's needed to find package.json
$ThemeSourceDir = Join-Path $ScriptDir "vscode-theme"

# Dynamically determine ThemeDirName from package.json
$PackageJsonPath = Join-Path $ThemeSourceDir "package.json"
$DefaultThemeDirName = "personal.white-rabbit-theme-0.0.1" # Updated Fallback

if (Test-Path $PackageJsonPath) {
    try {
        $PackageContent = Get-Content $PackageJsonPath -Raw | ConvertFrom-Json
        $PublisherName = $PackageContent.publisher
        $ExtensionName = $PackageContent.name
        $ExtensionVersion = $PackageContent.version
        if ($PublisherName -and $ExtensionName -and $ExtensionVersion) {
            $ThemeDirName = "$($PublisherName).$($ExtensionName)-$($ExtensionVersion)"
            &$ColorCyan "Using theme directory name: $ThemeDirName"
        } else {
            Write-Warning "Could not read publisher, name, or version from $PackageJsonPath. Using default theme directory name: $DefaultThemeDirName."
            $ThemeDirName = $DefaultThemeDirName
        }
    } catch {
        Write-Warning "Failed to parse $PackageJsonPath. Using default theme directory name: $DefaultThemeDirName. Error: $($_.Exception.Message)"
        $ThemeDirName = $DefaultThemeDirName
    }
} else {
    Write-Warning "$PackageJsonPath not found at $($PackageJsonPath). Using default theme directory name: $DefaultThemeDirName."
    $ThemeDirName = $DefaultThemeDirName
}

# Function to install theme for a VS Code version
function Install-VsCodeTheme {
    param (
        [string]$ExtensionsDir,
        [string]$VsCodeVersionName
    )

    $TargetThemeDir = Join-Path $ExtensionsDir $ThemeDirName

    # Create extensions directory if it doesn't exist
    if (-not (Test-Path $ExtensionsDir)) {
        New-Item -ItemType Directory -Path $ExtensionsDir -Force | Out-Null
    }

    # Check if theme is already installed and remove it
    if (Test-Path $TargetThemeDir) {
        &$ColorCyan "Removing previous White Rabbit Theme installation from $VsCodeVersionName (Path: $TargetThemeDir)..."
        Remove-Item -Recurse -Force $TargetThemeDir
    }

    # Create the main extension directory
    &$ColorCyan "Creating target theme directory: $TargetThemeDir..."
    New-Item -ItemType Directory -Path $TargetThemeDir -Force | Out-Null

    # Copy package.json to the root of the extension directory
    $SourcePackageJson = Join-Path $ThemeSourceDir "package.json"
    if (Test-Path $SourcePackageJson) {
        Copy-Item -Path $SourcePackageJson -Destination $TargetThemeDir -Force
    } else {
        Write-Warning "Source package.json not found at $SourcePackageJson"
        return # Cannot proceed without package.json
    }

    # Create the 'themes' subdirectory within the target extension directory
    $TargetThemesSubDir = Join-Path $TargetThemeDir "themes"
    New-Item -ItemType Directory -Path $TargetThemesSubDir -Force | Out-Null

    # Copy the contents of the source 'themes' folder into the target 'themes' subdirectory
    $SourceThemesFolder = Join-Path $ThemeSourceDir "themes"
    if (Test-Path $SourceThemesFolder) {
        Copy-Item -Path (Join-Path $SourceThemesFolder "*") -Destination $TargetThemesSubDir -Recurse -Force
    } else {
        Write-Warning "Source themes folder not found at $SourceThemesFolder"
    }

    # Copy README.md from vscode-theme/README.md to the root of the extension directory
    $ReadmeSourcePath = Join-Path $ThemeSourceDir "README.md"
    if (Test-Path $ReadmeSourcePath) {
        Copy-Item -Path $ReadmeSourcePath -Destination $TargetThemeDir -Force
    }

    # Copy LICENSE (from vscode-theme/LICENSE, if it exists - typically it's at repo root)
    # If LICENSE should be included, it might need to be copied from $ScriptDir/LICENSE
    $LicenseSourcePath = Join-Path $ThemeSourceDir "LICENSE" # Checks for vscode-theme/LICENSE
    if (Test-Path $LicenseSourcePath) {
        Copy-Item -Path $LicenseSourcePath -Destination $TargetThemeDir -Force
    }
    
    &$ColorCyan "Theme installation for $VsCodeVersionName complete."
}

# Install for VS Code (Stable)
if (Test-Path "$env:USERPROFILE\.vscode") {
    Install-VsCodeTheme -ExtensionsDir $VsCodeExtensionsDir -VsCodeVersionName "VS Code"
} else {
    &$ColorCyan "VS Code (Stable) directory not found. Skipping theme installation for it."
}

# Install for VS Code Insiders
if (Test-Path "$env:USERPROFILE\.vscode-insiders") {
    Install-VsCodeTheme -ExtensionsDir $VsCodeInsidersExtensionsDir -VsCodeVersionName "VS Code Insiders"
} else {
    &$ColorCyan "VS Code Insiders directory not found. Skipping theme installation for it."
}
Write-Host ""

# --- Install Terminal Colors (via VS Code settings.json) ---
&$ColorGreen "Installing White Rabbit Terminal Colors for VS Code..."

$TerminalThemeSettingsPath = Join-Path $ScriptDir "terminal\white-rabbit-vscode-settings.json"

function Update-VsCodeSettings {
    param (
        [string]$SettingsPath,
        [string]$VsCodeVersionName
    )

    if (-not (Test-Path $SettingsPath)) {
        &$ColorCyan "VS Code ($VsCodeVersionName) settings.json not found at $SettingsPath. Creating it."
        New-Item -Path $SettingsPath -ItemType File -Value "{}" -Force | Out-Null
    }

    # Read existing settings
    $CurrentSettingsJson = Get-Content $SettingsPath -Raw -ErrorAction SilentlyContinue
    if ($CurrentSettingsJson) {
        try {
            $CurrentSettings = ConvertFrom-Json $CurrentSettingsJson -ErrorAction Stop
        } catch {
            Write-Warning "Could not parse existing VS Code ($VsCodeVersionName) settings.json. It might be corrupted. Skipping terminal theme update for it."
            Write-Warning "Error: $($_.Exception.Message)"
            return
        }
    } else {
        $CurrentSettings = [PSCustomObject]@{} # Empty object if file was empty or just created
    }


    # Read theme settings
    $ThemeSettingsJson = Get-Content $TerminalThemeSettingsPath -Raw
    $ThemeSettings = ConvertFrom-Json $ThemeSettingsJson

    # Merge workbench.colorCustomizations
    if ($CurrentSettings.PSObject.Properties["workbench.colorCustomizations"]) {
        # Merge, theme settings take precedence
        foreach ($key in $ThemeSettings.'workbench.colorCustomizations'.PSObject.Properties.Name) {
            $CurrentSettings.'workbench.colorCustomizations'.$key = $ThemeSettings.'workbench.colorCustomizations'.$key
        }
    } else {
        $CurrentSettings | Add-Member -MemberType NoteProperty -Name "workbench.colorCustomizations" -Value $ThemeSettings.'workbench.colorCustomizations'
    }

    # Write updated settings back
    try {
        ConvertTo-Json $CurrentSettings -Depth 10 | Set-Content $SettingsPath -Force
        &$ColorCyan "White Rabbit terminal colors applied to VS Code ($VsCodeVersionName) settings."
    } catch {
        Write-Warning "Failed to write updated settings to VS Code ($VsCodeVersionName) settings.json."
        Write-Warning "Error: $($_.Exception.Message)"
    }
}

# Update for VS Code (Stable)
$VsCodeUserSettingsPath = "$env:APPDATA\Code\User\settings.json"
if (Test-Path "$env:APPDATA\Code\User") {
    Update-VsCodeSettings -SettingsPath $VsCodeUserSettingsPath -VsCodeVersionName "Stable"
} else {
    &$ColorCyan "VS Code (Stable) User directory not found. Skipping terminal color installation for it."
}


# Update for VS Code Insiders
$VsCodeInsidersUserSettingsPath = "$env:APPDATA\Code - Insiders\User\settings.json"
if (Test-Path "$env:APPDATA\Code - Insiders\User") {
    Update-VsCodeSettings -SettingsPath $VsCodeInsidersUserSettingsPath -VsCodeVersionName "Insiders"
} else {
    &$ColorCyan "VS Code Insiders User directory not found. Skipping terminal color installation for it."
}
Write-Host ""

# --- Install Starship Prompt ---
&$ColorGreen "Installing White Rabbit Starship Prompt..."

# Check if Starship is installed
$StarshipInstalled = Get-Command starship -ErrorAction SilentlyContinue
if (-not $StarshipInstalled) {
    &$ColorCyan "Starship is not installed."
    $choice = Read-Host "Would you like to install Starship now? (y/n)"
    if ($choice -eq 'y' -or $choice -eq 'Y') {
        &$ColorCyan "Installing Starship..."
        try {
            irm https://starship.rs/install.ps1 | iex
            # Verify installation
            $StarshipInstalled = Get-Command starship -ErrorAction SilentlyContinue
            if (-not $StarshipInstalled) {
                Write-Warning "Starship installation may have failed. Please check for errors."
            } else {
                &$ColorGreen "Starship installed successfully."
            }
        } catch {
            Write-Warning "Starship installation failed. Please try installing it manually from https://starship.rs"
            Write-Warning "Error: $($_.Exception.Message)"
        }
    } else {
        &$ColorCyan "Skipping Starship installation. You'll need to install it manually to use the White Rabbit prompt."
    }
} else {
    &$ColorCyan "Starship is already installed."
}

# Copy Starship configuration if Starship is (now) installed
if ($StarshipInstalled) {
    $StarshipSourceConfig = Join-Path $ScriptDir "starship\starship.toml"
    if (Test-Path $StarshipSourceConfig) {
        Copy-Item -Path $StarshipSourceConfig -Destination $StarshipConfigPath -Force
        &$ColorCyan "Starship configuration installed to $StarshipConfigPath"
    } else {
        Write-Warning "Starship configuration file not found at $StarshipSourceConfig"
    }

    # Check if Starship is in PowerShell profile and add if not
    $ProfilePath = $PROFILE
    if (-not (Test-Path $ProfilePath)) {
        &$ColorCyan "PowerShell profile not found at $ProfilePath. Creating it."
        New-Item -Path $ProfilePath -ItemType File -Force | Out-Null
    }

    $StarshipInitLine = 'Invoke-Expression (&starship init powershell)'
    $ProfileContent = Get-Content $ProfilePath -ErrorAction SilentlyContinue
    if ($ProfileContent -notmatch [regex]::Escape($StarshipInitLine)) {
        &$ColorCyan "Adding Starship initialization to PowerShell profile ($ProfilePath)..."
        Add-Content -Path $ProfilePath -Value "`n# Initialize Starship prompt`n$StarshipInitLine"
        &$ColorCyan "Starship initialization added to PowerShell profile."
    } else {
        &$ColorCyan "Starship already configured in PowerShell profile."
    }
}
Write-Host ""

&$ColorGreen "Installation Complete!"
Write-Host ""
&$ColorReset "To see the changes:"
&$ColorReset "1. Restart VS Code (if it was running)."
&$ColorReset "2. Restart your PowerShell terminal or run: . $PROFILE"
Write-Host ""
&$ColorReset "For more information, see:"
&$ColorReset "- VS Code Theme: $($ThemeSourceDir)\README.md"
&$ColorReset "- Terminal Colors: (Applied to VS Code settings, see terminal\white-rabbit-vscode-settings.json)"
&$ColorReset "- Starship Prompt: $(Join-Path $ScriptDir 'starship')\README.md"
Write-Host ""
&$ColorReset "Follow the white rabbit. 🐇"
