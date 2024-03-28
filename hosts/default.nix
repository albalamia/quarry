# Hosts will be defined with the following standard

# PCs     -
# Laptop  -
# Servers -

{ nixpkgs, ... }:

{
  default = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ./configuration.nix
    ];
  };
}