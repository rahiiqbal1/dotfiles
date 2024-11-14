{
    description = "Handles package channels and different configs for different hosts";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = {self, nixpkgs, ... }@inputs: {
        nixosConfigurations = {
            nixos-dsk = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                    ./dsk-configuration.nix
                ];
            };

#             nixos-lap = nixpkgs.lib.nixosSystem {
#                 system = "x86_64-linux";
#                 specialArgs = { inherit inputs; };
#                 modules = [
#                     ./configuration.nix
#                     ./lap_configuration.nix
#                     { networking.hostname = "nixos-lap"; }
#                 ];
#             };
        };
    };
}
