{lib, ...}: {
  flake.nixModules.base = {pkgs, ...}: {
    nix = {
      enable = pkgs.stdenv.hostPlatform.isLinux;
      settings = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        auto-optimise-store = true;
        warn-dirty = false;
      };
      gc = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
        automatic = true;
        interval = {
          Hour = 3;
          Minute = 15;
        };
        options = "--delete-older-than 5d";
      };
    };
  };
}
