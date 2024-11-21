lfcd () {
    # `command` is needed in case `lfcd` is aliased to `lf`
    builtin cd "$(command lf -print-last-dir "$@")"
}

function mkcd {
    mkdir "$1" && cd "$1";
}

function mkflk {
    touch "$1"
    echo '{
    description = "";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
        unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { nixpkgs, unstable, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
            pkgsUnstable = unstable.legacyPackages.${system};
        in {
            devShells.${system}.default = pkgs.mkShell {
                name = "";

                # Specify packages to use.
                nativeBuildInputs = with pkgs; [
                ];

                # Set any shell commands to execute on startup.
                shellHook = '\'''\''
                '\'''\'';

                # Set project specific environment variables below.
            };
        };
}' > "$1"
}
