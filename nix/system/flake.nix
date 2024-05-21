{
    description = "My firs flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = {nixpkgs, nixpkgs-stable, home-manager, ...}: 
    let
        system = "x86_64-linux";
    in {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            specialArgs = {
                pkgs-stable = import nixpkgs-stable {
                    inherit system;
                    config.allowUnfree = true;
                };
                inherit system;
            };
            modules = [./configuration/configuration.nix];
        };

        homeConfigurations.homaander = 
            home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages.${system};
                modules = [./home-manager/home.nix];
            };
    };
}