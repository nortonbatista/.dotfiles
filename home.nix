{ config, pkgs, ... }:

{
  home.username = "norton";
  home.homeDirectory = "/home/norton";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    vscodium
    fastfetch
    nixfmt-rfc-style
    vim
    librewolf-bin
    fastfetch
  ];

  home.file = { };

  home.sessionVariables = { };

  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "fastfetch -c neofetch";
      update = "nix flake update --flake ~/.dotfiles";
      upgrade = "sudo nixos-rebuild switch --flake ~/.dotfiles && home-manager switch --flake ~/.dotfiles";
    };
  };

  programs.git = {
    enable = true;
    userName = "nortonbatista";
    userEmail = "49415914+nortonbatista@users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.home-manager.enable = true;
}
