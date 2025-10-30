{
  pkgs,
  lib,
  config,
  ...
}: {
  config = lib.mkIf (config.shell.package == pkgs.fish) {
    programs.fish = {
      enable = true;
      shellAliases = lib.mkMerge [
        config.shell.aliases
        {
          rebuild =
            if pkgs.stdenv.hostPlatform.isDarwin
            then "sudo darwin-rebuild switch"
            else "sudo nixos-rebuild switch";
        }
      ];
    };
  };
}
