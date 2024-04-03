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

  # Define user accounts
  users.users.adam = {
    description = "Adam Brickhill";

    group = "users";
    extraGroups = [ "wheel" "networking" ];
    isNormalUser = true;
  };

  # Allow Unfree Packages
  nixpkgs.config.allowUnfree = true;

  # Installing Packages
  environment.pathsToLink = [ "/libexec" ];
  environment.systemPackages = with pkgs; [];

  # Services
  services.openssh.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet i3";
        user = "adam";
      };
    };
  };

  services.xserver = {
    enable = true;
    xkb.layout = "au";
    xkb.variant = "";

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        rofi # Application Launcher
      ];
    };

    excludePackages = [ pkgs.xterm ];
  };

  # Remote Desktop
  services.xrdp = {
    enable = true;
    openFirewall = true;
    defaultWindowManager = "i3";
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}