# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: {

    # Overlay to use unstable branch as an attribute of pkgs.
    nixpkgs.overlays = [
        (final: _: {
            unstable = import inputs.unstable {
                inherit (final.stdenv.hostPlatform) system;
                inherit (final) config;
            };
        })
        # GNOME 46: triple-buffering-v4-46
        (final: prev: {
            mutter = prev.mutter.overrideAttrs (old: {
                src = pkgs.fetchFromGitLab  {
                    domain = "gitlab.gnome.org";
                    owner = "vanvugt";
                    repo = "mutter";
                    rev = "triple-buffering-v4-46";
                    hash = "sha256-C2VfW3ThPEZ37YkX7ejlyumLnWa9oij333d5c4yfZxc=";
                };
            });
        })
    ];

    # Enable flakes and new CLI.
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Uncomment for latest kernel and drivers.
    # boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

    # Networking.
    # Enable networking.
    networking.networkmanager.enable = true;
    # Not setting hostname because it's done in the host-specific config.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";
    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_GB.UTF-8";
        LC_IDENTIFICATION = "en_GB.UTF-8";
        LC_MEASUREMENT = "en_GB.UTF-8";
        LC_MONETARY = "en_GB.UTF-8";
        LC_NAME = "en_GB.UTF-8";
        LC_NUMERIC = "en_GB.UTF-8";
        LC_PAPER = "en_GB.UTF-8";
        LC_TELEPHONE = "en_GB.UTF-8";
        LC_TIME = "en_GB.UTF-8";
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    # X11:
    # Enable the X11 windowing system.
    services.xserver.enable = true;
    # Configure keymap in X11
    services.xserver.xkb = {
        layout = "us";
        variant = "";
    };

    # Wayland:
    # Set environment variable to hint to electron apps to use wayland.
    # (See environment NIXOS_OZONE_WL variable set later).

    # Enable gdm and GNOME.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    environment.gnome.excludePackages = with pkgs; [
        gnome-photos
        gnome-tour
        gedit
        orca
        gnome-text-editor
        gnome-connections
        gnome.gnome-disk-utility
        gnome.gnome-system-monitor
        gnome.baobab
        gnome.simple-scan
        gnome.cheese
        gnome.yelp
        gnome.gnome-maps
        gnome.gnome-music
        gnome.epiphany
        gnome.geary
        gnome.gnome-characters
        gnome.gnome-calendar
        gnome.gnome-clocks
        gnome.gnome-contacts
        gnome.gnome-maps
        gnome.gnome-weather
        gnome.gnome-logs
        gnome.tali
        gnome.iagno
        gnome.hitori
        gnome.atomix
    ];
    # Also check the GNOME triple-buffering overlay defined in the nixpkgs.overlays variable.

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;
    
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.rahi = {
        isNormalUser = true;
        description = "Rahi Iqbal";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
        ];
    };

    # Add ~/bin/ to PATH.
    environment.homeBinInPath = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
        # For GNOME.
        gnome3.gnome-tweaks
        gnomeExtensions.pop-shell
        gnomeExtensions.just-perfection
        gnomeExtensions.space-bar
        gnomeExtensions.hide-cursor
        gnomeExtensions.appindicator
        gnomeExtensions.blur-my-shell
        gnomeExtensions.color-picker
        # CLI tools.
        gcc # Neovim needs it for something to do with file type checking I think.
        gzip
        xz
        unzip
        wget
        stow
        gparted
        git
        xclip
        wl-clipboard
        gh
        neofetch
        # Shell.
        unstable.starship
        btop
        gnutar
        ripgrep
        unstable.fzf # Required for fzf-fish
        unstable.fd # Required for fzf-fish
        unstable.bat # Required for fzf-fish
        fishPlugins.fzf-fish
        fishPlugins.gruvbox
        # LSPs.
        lua-language-server
        nil
        # Apps.
        unstable.foot
        unstable.tmux
        popsicle
        nerdfonts
        unstable.neovim
        unstable.lf
        firefox
        electrum-ltc
        unstable.qbittorrent
    ];

    programs.fish.enable = true;
    programs.bash = {
        interactiveShellInit = ''
            if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
            then
                shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
                exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
            fi
        '';
    };

    # Set environment variables.
    environment.variables = {
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
        QT_QPA_PLATFORM="wayland";
        # NIXOS_OZONE_WL = "1"; # Hint to electron apps to use wayland
        # MUTTER_DEBUG_DISABLE_HW_CURSORS = 1; # Helps with cursor lag on gnome wayland.
    };

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    system.stateVersion = "24.05";
}
