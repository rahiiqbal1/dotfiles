# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }: {

    # Overlay to use unstable branch as an attribute of pkgs.
    nixpkgs.overlays = [
        (final: prev: {
            unstable = import inputs.unstable {
                inherit (final.stdenv.hostPlatform) system;
                inherit (final) config;
            };
            # cosmic-comp = prev.cosmic-comp.overrideAttrs (oldAttrs: {
            #     postPatch = ''
            #         ${oldAttrs.postPatch or ""}
            #         find src/shell -type f -name "*.rs -exec sed -i \
            #         's/Duration::from_millis([0-9]\+)/Duration::from_millis(1)/g' {};
            #     '';
            # });
        })
    ];

    # Permitting weird python 313 package to fix install bug :/
    nixpkgs.config.permittedInsecurePackages = [ "python3.13-ecdsa-0.19.1" ];

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

    services.displayManager.cosmic-greeter.enable = true;
    services.desktopManager.cosmic.enable = true;
    services.system76-scheduler.enable = true;
    environment.cosmic.excludePackages = with pkgs; [
        cosmic-edit
    ];

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

    # Add nerdfonts
    fonts.packages = [ pkgs.nerd-fonts.jetbrains-mono ];

    # Add ~/bin/ to PATH.
    environment.homeBinInPath = true;

    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;
    environment.systemPackages = with pkgs; [
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
        starship
        btop
        gnutar
        ripgrep
        fzf # Required for fzf-fish
        fd # Required for fzf-fish
        bat # Required for fzf-fish
        fishPlugins.fzf-fish
        fishPlugins.gruvbox
        # LSPs.
        lua-language-server
        nil
        # Apps.
        foot
        tmux
        popsicle
        neovim
        lf
        firefox
        # electrum-ltc
        qbittorrent
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
