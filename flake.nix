{
  description = "My systems' configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    self,
    nix-darwin,
    nix-homebrew,
    home-manager,
    nixpkgs,
    ...
  }: let
    system-lib = import ./lib/system.nix {
      inherit
        nixpkgs
        nix-darwin
        nix-homebrew
        home-manager
        ;
    };
  in
    with system-lib; {
      darwinConfigurations.personal = mkDarwin {username = "voidptr";};

      checks = forAllSystems (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        fmt =
          pkgs.runCommand "fmt" {
            buildInputs = [self.formatter.${system}];
            src = ./.;
          } ''
            alejandra --check $src
            touch $out
          '';
      });
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
    };
}
