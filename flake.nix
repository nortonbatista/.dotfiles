{
  description = "NixOS Flake";

  inputs = {
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:

    {
      nixosConfigurations = {
        ghetsis = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
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
          ];
        };
      };
    };
}
