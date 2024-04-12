{
  description = "Syndicate";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
  {
    nixosConfigurations = (
      import ./hosts {
        # Functional
        inherit nixpkgs home-manager;
        # Non-Functional
      }
    );
  };
}

