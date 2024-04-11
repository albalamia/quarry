{
  description = "Syndicate";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    unstable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, unstable, home-manager, ... }:
  {
    nixosConfigurations = (
      import ./hosts {
        # Functional
        inherit nixpkgs unstable home-manager;
        # Non-Functional
      }
    );
  };
}

