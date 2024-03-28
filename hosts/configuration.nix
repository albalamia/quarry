{ pkgs, ... }:

{
  # Installing Packages
  environment.systemPackages = with pkgs; [
    # Shell
    zsh
    # Github
    git
    # Tools
    trash-cli
  ];

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "23.11";
}
