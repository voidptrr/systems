{ lib, ... }:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "ls -al";
      drb = "sudo darwin-rebuild switch";
      svim = "sudo vim";
    };

    initContent = lib.mkOrder 500 ''
      autoload -Uz vcs_info
      zstyle ':vcs_info:git:*' formats '%F{red}[%b]%f '
      
      precmd() { 
        vcs_info 
        PROMPT="%F{red}%n%f in %F{yellow}%~%f %F{red}''${vcs_info_msg_0_}%f%# "
      }
    '';
  };
}
