{
  neofetch = "fastfetch -c neofetch";
  update = "nix flake update --flake ~/.dotfiles";
  upgrade = "sudo nixos-rebuild switch --flake ~/.dotfiles";
}
