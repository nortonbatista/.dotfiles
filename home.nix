{ config, pkgs, ... }:

{
  home.username = "norton";
  home.homeDirectory = "/home/norton";

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

  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      user = {
        name = "nortonbatista";
        email = "49415914+nortonbatista@users.noreply.github.com";
      };
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      neofetch = "fastfetch -c neofetch";
      update = "nix flake update --flake ~/.dotfiles";
      upgrade = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      neofetch = "fastfetch -c neofetch";
      update = "nix flake update --flake ~/.dotfiles";
      upgrade = "sudo nixos-rebuild switch --flake ~/.dotfiles";
    };
    initContent = ''
      bindkey "^[[H"    beginning-of-line
      bindkey "^[[F"    end-of-line
      bindkey "^[[3~"   delete-char
      bindkey "^[[1;5D" backward-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[3;5~" kill-word

      source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme
      source ${pkgs.zinit}/share/zinit/zinit.zsh

      SPACESHIP_PROMPT_ORDER=(
        user          # Username section
        dir           # Current directory section
        host          # Hostname section
        git           # Git section (git_branch + git_status)
        hg            # Mercurial section (hg_branch  + hg_status)
        exec_time     # Execution time
        line_sep      # Line break
        jobs          # Background jobs indicator
        exit_code     # Exit code section
        char          # Prompt character
      )
      SPACESHIP_USER_SHOW=always
      SPACESHIP_PROMPT_ADD_NEWLINE=false
      SPACESHIP_CHAR_SYMBOL="❯"
      SPACESHIP_CHAR_SUFFIX=" "

      zinit light zdharma/fast-syntax-highlighting
      zinit light zsh-users/zsh-autosuggestions
      zinit light zsh-users/zsh-completions
    '';
  };

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
