{ config, pkgs, inputs, ... }: {
    # # Overlay to use unstable repo. Already defined in configuration.nix.
    # nixpkgs.overlays = [
    #     (final: _: {
    #         unstable = import inputs.unstable {
    #             inherit (final.stdenv.hostPlatform) system;
    #             inherit (final) config;
    #         };
    #     })
    # ];

    # # Latest kernel and drivers. This is already defined in configuration.nix.
    # boot.kernelPackages = pkgs.unstable.linuxPackages_latest;

    # Stuff for NVIDIA drivers and card.
    hardware.opengl = {
        enable = true;
    };
    services.xserver.videoDrivers = ["nvidia"];
    # This stops the detection of a display which isn't there.
    boot.kernelParams = [ "nvidia_drm.fbdev=1" ]; 
    hardware.nvidia = {
        modesetting.enable = true;
        powerManagement.enable = false;
        powerManagement.finegrained = false;
        open = false;
        nvidiaSettings = true;
        package = config.boot.kernelPackages.nvidiaPackages.beta;
        # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        #     version = "555.58";
        #     sha256_64bit = "sha256-bXvcXkg2kQZuCNKRZM5QoTaTjF4l2TtrsKUvyicj5ew=";
        #     sha256_aarch64 = "sha256-7XswQwW1iFP4ji5mbRQ6PVEhD4SGWpjUJe1o8zoXYRE=";
        #     openSha256 = "sha256-hEAmFISMuXm8tbsrB+WiUcEFuSGRNZ37aKWvf0WJ2/c=";
        #     settingsSha256 = "sha256-vWnrXlBCb3K5uVkDFmJDVq51wrCoqgPF03lSjZOuU8M=";
        #     persistencedSha256 = "sha256-lyYxDuGDTMdGxX3CaiWUh1IQuQlkI2hPEs5LI20vEVw=";
        # };
    };
}
