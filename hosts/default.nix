# Hosts will be defined with the following standard

# PCs     -
# Laptop  -
# Servers -

{ nixpkgs, unstable, home-manager, ... }:

{
  maliketh = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./maliketh
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
    specialArgs = {
      inherit unstable;
    };
  };

  nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./nixos
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };
}