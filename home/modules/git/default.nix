{ config, pkgs, ... }:

{
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
}
