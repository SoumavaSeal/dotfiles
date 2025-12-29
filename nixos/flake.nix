{
    description = "Nix flake for my laptop setup";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
    };

    outputs = inputs@{ self, nixpkgs, ... }: {
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                ];
                specialArgs = { inherit inputs;};
            };
        };
    }; 
}
