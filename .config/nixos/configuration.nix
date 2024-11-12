# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: {

    imports = [ 
        # Include the results of the hardware scan.
        ./hardware-configuration.nix
    ];

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

    # Latest kernel and drivers.
    boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

    # Stuff for NVIDIA drivers and card.
    hardware.opengl = {
        enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
    };

    # Networking.
    # Enable networking
    networking.networkmanager.enable = true;
    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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

    # Enable the GNOME Desktop Environment.
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
        gnome.gnome-logs
        gnome.totem
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
        gnomeExtensions.hide-cursor
        # CLI tools.
        wl-clipboard
        unstable.starship
        btop
        unstable.fzf
        gnutar
        gzip
        xz
        gcc
        efibootmgr
        wget
        stow
        gparted
        git
        ripgrep
        gh
        neofetch
        # Apps.
        nerdfonts
        unstable.foot
        unstable.neovim
        unstable.lf
        firefox
    ];

    # Set environment variables.
    environment.variables = {
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
        NIXOS_OZONE_WL = "1"; # Hint to electron apps to use wayland
        # WLR_NO_HARDWARE_CURSORS = "1"; # If cursor becomes invisible on wayland
    };

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    system.stateVersion = "24.05";
}
