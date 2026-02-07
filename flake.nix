{
  description = "My systems' configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    import-tree.url = "github:vic/import-tree";
    flake-parts.url = "github:hercules-ci/flake-parts";
    flake-parts.inputs.nixpkgs-lib.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {...} @ inputs: let
    lib = inputs.nixpkgs.lib;
  in
    inputs.flake-parts.lib.mkFlake {inherit inputs;}
    {
      imports = [
        (inputs.import-tree ./modules)
      ];

      options = {
        flake.darwinModules = lib.mkOption {
          type = lib.types.attrsOf lib.types.raw;
          default = {};
          description = "Registry of nix-darwin modules provided by branch leaves.";
        };
        flake.homeManagerModules = lib.mkOption {
          type = lib.types.attrsOf lib.types.raw;
          default = {};
          description = "Registry of Home Manager modules provided by dev/shell leaves.";
        };
      };

      config = {
        systems = ["aarch64-darwin"];
        perSystem = {pkgs, ...}: {
          formatter = pkgs.alejandra;
          checks = {
            fmt = pkgs.runCommand "fmt-check" {} ''
              cd ${./.}
              ${pkgs.alejandra}/bin/alejandra --check .
              touch $out
            '';
          };
        };
      };
    };
}
