{
  pkgs,
  lib,
  ...
}:
with lib; {
  options.shell = mkOption {
    type = types.submodule {
      options = {
        aliases = mkOption {
          type = types.attrsOf types.str;
          description = "Which aliases to set for the shell.";
          default = {};
        };
        package = mkOption {
          type = types.addCheck types.package (pkg: builtins.elem (getName pkg) ["fish" "zsh"]);
          default = pkgs.zsh;
          description = "Which shell to use (fish, zsh).";
        };
      };
    };
  };
}
