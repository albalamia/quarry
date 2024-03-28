{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Time Zone
  time.timeZone = "Australia/Perth";

  # Internationalisation Properties
  i18n.defaultLocale = "en_AU.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_AU.UTF-8";
    LC_IDENTIFICATION = "en_AU.UTF-8";
    LC_MEASUREMENT = "en_AU.UTF-8";
    LC_MONETARY = "en_AU.UTF-8";
    LC_NAME = "en_AU.UTF-8";
    LC_NUMERIC = "en_AU.UTF-8";
    LC_PAPER = "en_AU.UTF-8";
    LC_TELEPHONE = "en_AU.UTF-8";
    LC_TIME = "en_AU.UTF-8";
  };

  # Keymap in X11
  services.xserver = {
    layout = "au";
    xkbVariant = "";
  };

  # Define user accounts
  users.users.adamb = {
    description = "Adam Brickhill";

    group = "users";
    extraGroups = [ "wheel" "networking" ];
    isNormalUser = true;
  };

  # Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Installing Packages
  environment.systemPackages = with pkgs; [];

  # Services
  services.openssh.enable = true;
}