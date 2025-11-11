{
  description = "NixOS Flake";

  inputs = {
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-ruby.url = "github:NixOS/nixpkgs/01d5c88f6d07caf73b35b94fbf6ac4eb502201d1";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-minecraft,
      nixpkgs-ruby,
      ...
    }:

    let
      system = "x86_64-linux";
      pkgsRuby = nixpkgs-ruby.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        ghetsis = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit nix-minecraft pkgsRuby; };
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
              nixpkgs.config.permittedInsecurePackages = [
                "electron-36.9.5"
              ];
            }
          ];
        };
      };
    };
}
