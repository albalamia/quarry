# Adams Setup

{ pkgs, ... }:

{
  # networking.hostName = "walnut";

  # Installing Packages
  environment.systemPackages = with pkgs; [];
}