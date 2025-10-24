{ config, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    priority = 100;
  };
}
