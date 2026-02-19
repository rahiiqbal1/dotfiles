{
    description = "Handles package channels and different configs for different hosts";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = {self, nixpkgs, ... }@inputs: {
        nixosConfigurations = {
            nixos-dsk = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                    ./dsk/dsk-configuration.nix
                    { networking.hostName = "nixos-dsk"; }
                ];
            };

            nixos-lap = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./configuration.nix
                    ./lap/lap-configuration.nix
                    { networking.hostName = "nixos-lap"; }
                ];
            };
        };
    };
}
