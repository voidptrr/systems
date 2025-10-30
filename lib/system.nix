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
    machine-options,
  }: let
    nix-darwin-modules = import ../modules/nix-darwin;
    home-manager-modules = import ../modules/home-manager;
    shared-options = import ../modules/shared;
    nix-options = mkBasicConfig system;
  in
    nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = {
        inherit
          username
          nixvim
          machine-options
          shared-options
          ;
      };
      modules = [
        nix-options
        shared-options
        machine-options
        nix-darwin-modules
        nix-homebrew.darwinModules.nix-homebrew

        home-manager.darwinModules.home-manager
        home-manager-modules
      ];
    };
}
