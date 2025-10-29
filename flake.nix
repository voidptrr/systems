{
  description = "My systems' configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # MacOS
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Nvim
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nix-homebrew,
    home-manager,
    nixpkgs,
    nixvim,
    neovim-nightly-overlay,
    ...
  }: let
    system-lib = import ./lib/system.nix {
      inherit
        nixpkgs
        nix-darwin
        nix-homebrew
        home-manager
        nixvim
        neovim-nightly-overlay
        ;
    };
  in
    with system-lib; {
      darwinConfigurations.personal = mkDarwin {username = "voidptr";};
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
