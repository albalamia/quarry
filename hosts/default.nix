# Hosts will be defined with the following standard

# PCs     -
# Laptop  -
# Servers -

{ nixpkgs, ... }:

{
  adam = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./adam
      ./configuration.nix
    ];
  };

  nixos = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./nixos
      ./configuration.nix
    ];
  };
}