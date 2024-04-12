{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "maliketh";
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

  # Define user accounts
  users = {
    users.adam = {
      description = "Adam Brickhill";

      group = "users";
      extraGroups = [ "wheel" "networking" ];
      isNormalUser = true;
      useDefaultShell = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.adam = import ./home.nix;
  };

  # Installing Packages
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [
    bun
  ];

  # Services
  services.openssh.enable = true;

  services.xserver = {
    enable = true;
    xkb.layout = "au";
    xkb.variant = "";

    displayManager.sx.enable = true;
    windowManager.i3.enable = true;

    excludePackages = [ pkgs.xterm ];
  };

  # Remote Desktop
  services.xrdp = {
    enable = true;
    openFirewall = true;
    defaultWindowManager = "i3";
  };
}