{
    description = "Configuration flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = {nixpkgs, ...}@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
            ];
        };
    };
}
