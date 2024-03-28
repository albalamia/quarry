{ pkgs, ... }:

{
  networking.hostName = "remote";

  # Define user accounts
  users.users.adamb = {
    description = "Adam Brickhill's Account";

    group = "users";
    extraGroups = [ "wheel" "networking" ];
    isNormalUser = true;
  };

  # Installing Packages
  environment.systemPackages = with pkgs; [];
}