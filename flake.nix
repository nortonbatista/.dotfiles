{
  description = "NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        ghetsis = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ]; # Path to your NixOS configuration
        };
      };
      homeConfigurations = {
        norton = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ]; # Path to your NixOS configuration
        };
      };
    };
}
