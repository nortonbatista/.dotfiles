{
  config,
  pkgs,
  ...
}:

{
  # This config is gonna be the config that I use in my work pc.
  environment.systemPackages =
    with pkgs;
    [
      slack
      spotify
      librewolf-bin
      vscodium
      docker-compose
      nodejs_22
      libpq
      heroku
      pkg-config
      gcc
      gnumake
      zlib
      openssl
      libyaml
      libyaml.dev
      libffi
      sqlite
      postgresql
      autoconf
      automake
      ruby_3_4
    ]

  users.extraGroups.docker.members = [ "norton" ];

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
