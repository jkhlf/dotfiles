# Ultimate Windows 11 + WSL 2 Development Environment

This guide provides step-by-step instructions for creating a powerful development environment using Windows 11 with WSL 2 Arch Linux. This setup combines the best of both worlds: Windows UI with Linux development tools.

## Table of Contents

1. [Windows Setup](#windows-setup)
   - [Required Tools](#required-tools)
   - [YASB (Status Bar)](#yasb)
   - [Komorebi (Window Manager)](#komorebi)
   - [WHKD (Hotkey Daemon)](#whkd)
   - [Wezterm (Terminal)](#wezterm)
2. [WSL 2 Arch Linux Setup](#wsl-2-arch-linux-setup)
   - [Initial Setup](#initial-setup)
   - [User Configuration](#user-configuration)
3. [Development Tools](#development-tools)
   - [Terminal Tools](#terminal-tools)
   - [Development Environment](#development-environment)
4. [Configuration Files](#configuration-files)

## Windows Setup

### Required Tools

- [Nerd Fonts](https://www.nerdfonts.com/font-downloads) - [JetBrainsMono](https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip) recommended
- [Windows Terminal](https://apps.microsoft.com/detail/9N0DX20HK701) - For PowerShell and CMD
- [Wezterm](https://wezfurlong.org/wezterm/install/windows.html) - Terminal emulator for WSL

### YASB

YASB is a highly configurable Windows status bar written in Python.

#### Installation

```powershell
winget install --id AmN.yasb
```

Or download the latest installer from the [GitHub releases page](https://github.com/amnweb/yasb/releases/latest).

#### Configuration

The configuration files are located in the `yasb` directory:
- `config.yaml` - Main configuration file
- `styles.css` - CSS styling for the bar

### Komorebi

Komorebi is a tiling window manager for Windows.

#### Installation

```powershell
winget install LGUG2Z.komorebi
```

Or follow instructions at [GitHub repository](https://github.com/LGUG2Z/komorebi).

#### Configuration

The configuration files are located in the `komorebi` directory:
- `komorebi.json` - Main configuration file
- `komorebi.bar.json` - Bar configuration
- `applications.json` - Application-specific settings

### WHKD

WHKD is a hotkey daemon for Windows that works with Komorebi.

#### Installation

```powershell
winget install LGUG2Z.whkd
```

#### Configuration

The hotkey configuration is in the `whkdrc/whkdrc` file. Key bindings include:

- `alt + o`: Reload WHKD configuration
- `alt + q`: Close current window
- `alt + h/j/k/l`: Focus left/down/up/right
- `alt + shift + h/j/k/l`: Move window left/down/up/right
- `alt + 1-8`: Switch to workspace 1-8

### Wezterm

Wezterm is a GPU-accelerated terminal emulator.

#### Installation

Download from [Wezterm website](https://wezfurlong.org/wezterm/install/windows.html)

#### Configuration

The configuration file is `.wezterm.lua` in the `wezterm` directory. Features include:

- Catppuccin Mocha color scheme
- OpenGL rendering with 144 FPS
- WSL integration
- JetBrainsMono Nerd Font
- Split panes with `CTRL+SHIFT+ALT+h/v`

## WSL 2 Arch Linux Setup

### Initial Setup

1. Install WSL 2 with Arch Linux
2. Set up the package manager:

```bash
sudo pacman-key --init
sudo pacman-key --populate
sudo pacman -Sy archlinux-keyring
sudo pacman -Su
```

### User Configuration

1. Create a new user:

```bash
pacman -Syu
useradd -m -G wheel your_username
passwd your_username
pacman -S sudo
pacman -S nano
```

2. Configure sudo:

```bash
EDITOR=nano visudo
```

Uncomment the line:
```
%wheel ALL=(ALL) ALL
```

3. Set default user:

```bash
nano /etc/wsl.conf
```

Add:
```
[user]
default = your_username
```

4. Restart WSL to apply changes

## Development Tools

### Terminal Tools

- **Zsh with Oh-My-Zsh**: Enhanced shell
- **Powerlevel10k**: Shell theme
- **Tmux**: Terminal multiplexer
- **FZF**: Fuzzy finder
- **Bat**: Better cat command
- **Ripgrep**: Fast search tool
- **Eza**: Modern ls alternative
- **Zoxide**: Smarter cd command
- **Lazygit**: Git TUI
- **Btop**: System monitor
- **Fastfetch**: System info

### Development Environment

- **Mise**: Runtime version manager
- **Docker & Lazy Docker**: Containerization
- **Neovim**: Text editor with LazyVim config
- **VSCode**: IDE with WSL integration

## Configuration Files

- Neovim: Configuration in `nvim/` directory
- Zsh: Configuration in `zsh/.zshrc`
- Wezterm: Configuration in `wezterm/.wezterm.lua`
- WHKD: Hotkeys in `whkdrc/whkdrc`
- Komorebi: Window management in `komorebi/` directory
- YASB: Status bar in `yasb/` directory
