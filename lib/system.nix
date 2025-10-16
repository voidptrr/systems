{
  nixpkgs,
  nix-darwin,
  nix-homebrew,
  home-manager,
  ...
}: let
  systems = ["aarch64-darwin"];

  mkBasicConfig = system: {
    nix.enable = (import nixpkgs {inherit system;}).stdenv.hostPlatform.isLinux;
    nixpkgs.hostPlatform = system;
  };
in {
  forAllSystems = f:
    builtins.listToAttrs (
      map (system: {
        name = system;
        value = f system;
      })
      systems
    );

  mkDarwin = {
    system ? "aarch64-darwin",
    username,
  }:
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit username;};
      modules = [
        (import ../modules/nix-darwin)
        (mkBasicConfig system)
        nix-homebrew.darwinModules.nix-homebrew

        home-manager.darwinModules.home-manager
        (import ../modules/home-manager)
      ];
    };
}
