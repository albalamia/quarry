{ pkgs, ... }:

{
  home = {
    username = "adam";
    homeDirectory = "/home/adam";
    stateVersion = "23.11";
    packages = with pkgs;
    [

    ];
  };

  # Git
  programs.git = {
    enable = true;
    userName = "albalamia";
    userEmail = "adam.brickhill@seamlessintelligence.com.au";
    extraConfig = {
      credential.helper = "store";
    };
  };

  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      # theme = "albalamia";
      custom = "/home/adam/.oh-my-zsh";
    };

    history.size = 1000;
  };
  # home.file.".oh-my-zsh/themes/albalamia.zsh-theme".source = ../programs/zsh/albalamia.zsh-theme;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}