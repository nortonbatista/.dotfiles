{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "norton";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Remove NixOS documentation pkg.
  documentation.enable = false;

  # Remove XTerm pkg.
  services.xserver.excludePackages = with pkgs; [ xterm ];

  # Remove some gnome default pkgs.
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
    gnome-connections
    gnome-maps
    gnome-characters
    gnome-contacts
    gnome-weather
    gnome-music
    snapshot
    epiphany
    geary
    yelp
    simple-scan
  ];
}
