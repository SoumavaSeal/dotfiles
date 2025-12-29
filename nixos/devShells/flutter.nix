{
    description = "Flutter 3.13.x";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/23.11";
        flake-utils.url = "github:numtide/flake-utils";
    };

    outputs = { self, nixpkgs, flake-utils }:
    let
        pkgs = import nixpkgs {
            system = "x86_64-linux"; 
            config.allowUnfree = true;
            config.android_sdk.accept_license = true;
        };

        androidEnv = pkgs.androidenv.override { licenseAccepted = true; };

        androidComposition = androidEnv.composeAndroidPackages {
            includeEmulator = true;
            includeNDK = false;
            abiVersions = [ "x86_64" ];
            includeSystemImages = true;
            systemImageTypes = [ "google_apis" ];
            useGoogleAPIs = true;
            platformVersions = [ "34" "28" ];
        };

      androidSdk = androidComposition.androidsdk;
    in {
        devShells.x86_64-linux.default = pkgs.mkShell {
            ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
            ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
            buildInputs = with pkgs; [
              flutter
              androidSdk
              javaPackages.compiler.openjdk17
            ];
        };
    };
}
