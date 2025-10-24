{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ prismlauncher ];

  services.minecraft-server = {
    enable = true;
    eula = true;
    openFirewall = true;
  };
}
