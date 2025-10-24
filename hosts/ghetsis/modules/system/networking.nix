{ config, pkgs, ... }:

{
  networking = {
    # Define your hostname.
    hostName = "ghetsis";

    # Enable networking
    networkmanager.enable = true;
  };
}
