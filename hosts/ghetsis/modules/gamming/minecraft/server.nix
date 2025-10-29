{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.nix-minecraft.nixosModules.minecraft-servers ];
  nixpkgs.overlays = [ inputs.nix-minecraft.overlay ];

  services.minecraft-servers = {
    enable = true;
    eula = true;
    openFirewall = true;

    servers = {
      cobblemon = {
        enable = true;
        package = pkgs.fabricServers.fabric-1_21_1;

        symlinks = {
          mods = pkgs.linkFarmFromDrvs "mods" (
            builtins.attrValues {
              Fabric = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/m6zu1K31/fabric-api-0.116.7%2B1.21.1.jar";
                sha512 = "DXv5flFs/bdC1+N6RW7VH5bEbqwGDA8rgDOAiWcLOKui96mDfl4Hpr3L9zLpAgFPsSAvbhjgDW0rVgqE3fnAJA==";
              };
              Cobblemon = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/MdwFAVRL/versions/v77SHSXW/Cobblemon-fabric-1.6.1%2B1.21.1.jar";
                sha512 = "twgr7+4H79PgxYV4B/c5CC31mU7A5/4yF85s2ux9LKR+1RvRKQlv1Oyoy8995BXRRgKGijNXmA/4jlWzFI3H9A==";
              };
            }
          );
        };

      };
    };
  };
}
