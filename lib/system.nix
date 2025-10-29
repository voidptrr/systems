{
  nixpkgs,
  nix-darwin,
  nix-homebrew,
  home-manager,
  nixvim,
  neovim-nightly-overlay,
  ...
}: let
  systems = ["aarch64-darwin"];

  mkBasicConfig = system: {
    nix.enable = (import nixpkgs {inherit system;}).stdenv.hostPlatform.isLinux;
    nixpkgs = {
      hostPlatform = system;
      overlays = [neovim-nightly-overlay.overlays.default];
    };
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
  }: let
    nix-darwin-modules = import ../modules/nix-darwin;
    home-manager-modules = import ../modules/home-manager;
    nix-options = mkBasicConfig system;
  in
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {inherit username nixvim;};
      modules = [
        nix-options

        nix-darwin-modules
        nix-homebrew.darwinModules.nix-homebrew

        home-manager.darwinModules.home-manager
        home-manager-modules
      ];
    };
}
