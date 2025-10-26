{ config, pkgs, ... }:

{
  imports = [ ./server.nix ];

  environment.systemPackages = with pkgs; [ prismlauncher ];
}
