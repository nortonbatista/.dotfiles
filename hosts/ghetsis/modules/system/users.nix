{ config, pkgs, ... }:

{
  # Enables zsh to be used as the default shell.
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.norton = {
    isNormalUser = true;
    description = "Norton";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };
}
