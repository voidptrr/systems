{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -al";
      drb = "sudo darwin-rebuild switch";
    };

    initContent = lib.mkOrder 500 ''
      PROMPT='%F{red}%n%f in %F{yellow}%~%f %# '
    '';
  };
}
