{ config, pkgs, ... }:

{
  imports = [
    ./modules/shell
    ./modules/git
  ];

  home.packages = with pkgs; [
    vscodium
    fastfetch
    nixfmt-rfc-style
    vim
    librewolf-bin
    prismlauncher
    vesktop
    spaceship-prompt
    zinit
  ];

  home.file = { };

  home.sessionVariables = { };

  home.username = "norton";
  home.homeDirectory = "/home/norton";

  programs.home-manager.enable = true;

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
