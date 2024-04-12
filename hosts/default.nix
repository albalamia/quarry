# Hosts will be defined with the following standard

# PCs     -
# Laptop  -
# Servers -

{ nixpkgs, home-manager, ... }:

{
  maliketh = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./maliketh
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };

  vm = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./vm
      ./configuration.nix
      home-manager.nixosModules.home-manager
    ];
  };
}