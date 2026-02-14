{lib, ...}: {
  flake.darwinModules.dock = {config, ...}: {
    options.dockConfig.persistentApps = lib.mkOption {
      type = lib.types.listOf lib.types.attrs;
      default = [];
    };

    config.system.defaults.dock = {
      autohide = true;
      launchanim = false;
      magnification = false;
      minimize-to-application = true;
      mineffect = null;
      orientation = "bottom";
      persistent-apps = config.dockConfig.persistentApps;
      show-recents = false;
      tilesize = 48;
    };
  };
}
