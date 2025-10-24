{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    spaceship-prompt
    zinit
  ];

  programs.zsh = {
    enable = true;
    shellAliases = import ../shellAliases.nix;
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
}
