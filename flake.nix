{
  description = "NixOS Flake";

  inputs = {
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-ruby.url = "github:NixOS/nixpkgs/01d5c88f6d07caf73b35b94fbf6ac4eb502201d1";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-ruby,
      home-manager,
      nix-minecraft,
      ...
    }:

    let
      system = "x86_64-linux";

      pkgsRuby = nixpkgs-ruby.legacyPackages.${system};
      ruby-overlay = final: prev: {
        ruby_3_4 = pkgsRuby.ruby_3_4; # 3.4.6
      };
    in
    {
      nixosConfigurations = {
        ghetsis = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit nix-minecraft; };
          modules = [
            ./hosts/ghetsis
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.norton = import ./home;
                backupFileExtension = "backup";
              };
            }
            {
              nixpkgs.overlays = [
                ruby-overlay
              ];
            }
          ];
        };
      };
    };
}
