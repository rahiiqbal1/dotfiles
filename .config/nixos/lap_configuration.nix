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
}
