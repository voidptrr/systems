{lib, ...}: {
  flake.darwinModules.homebrew = {
    username,
    config,
    ...
  }: let
    cfg = config.homebrewConfig;
  in {
    options.homebrewConfig = {
      brews = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      casks = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
      };
      masApps = lib.mkOption {
        type = lib.types.attrsOf lib.types.int;
        default = {};
      };
    };

    config = {
      nix-homebrew = {
        enable = true;
        enableRosetta = true;
        user = username;
      };

      homebrew = {
        enable = true;
        onActivation = {
          autoUpdate = true;
          upgrade = true;
          cleanup = "zap";
        };

        brews = cfg.brews;
        casks = cfg.casks;
        masApps = cfg.masApps;
      };
    };
  };
}
