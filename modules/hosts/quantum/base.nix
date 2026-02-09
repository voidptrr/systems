{
  self,
  inputs,
  ...
}: let
  system = "aarch64-darwin";
  username = "voidptr";
  systemPkgs = import inputs.nixpkgs {inherit system;};

  baseModule = {
    nix.enable = systemPkgs.stdenv.hostPlatform.isLinux;
    nixpkgs = {
      hostPlatform = system;
      config.allowUnfreePredicate = pkg:
        builtins.elem (systemPkgs.lib.getName pkg) ["obsidian"];
    };
  };

  darwinStack = [
    self.darwinModules.system
    self.darwinModules.homebrew
    self.darwinModules."quantum"
    self.darwinModules."home-manager-entry"
  ];

  homeModules = builtins.attrValues self.homeManagerModules;
in {
  flake.darwinConfigurations.personal = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {
      inherit username;
      homeManagerModules = homeModules;
    };
    modules =
      [baseModule]
      ++ darwinStack
      ++ [
        inputs.nix-homebrew.darwinModules.nix-homebrew
        inputs.home-manager.darwinModules.home-manager
      ];
  };
}
