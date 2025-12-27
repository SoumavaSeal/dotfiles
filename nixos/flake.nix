{
    description = "A simple Nix flake for my setup";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        zen-browser.url = "github:0xc000022070/zen-browser-flake";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = inputs@{ self, nixpkgs, flake-utils, ... }: {
        # NixOS system configuration
        nixosConfigurations = {
            nixos = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./configuration.nix
                ];
                specialArgs = { inherit inputs;};
            };
        };

        # Development shell
        devShell = flake-utils.lib.eachDefaultSystem (system:
            let
                pkgs = import nixpkgs { 
                    inherit system;
                    config = {
                        android_sdk.accept_license = true;
                        allowUnfree = true;
                    };
                };
                androidSdk = pkgs.androidenv.androidPkgs.androidSdk;
            in
            pkgs.mkShell rec {
                ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
                buildInputs = with pkgs; [
                    flutter
                    androidSdk
                    javaPackages.compiler.openjdk17
                ];
            }
        );
    }; 
}
