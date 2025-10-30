{pkgs, ...}: {
  shell = {
    package = pkgs.zsh;
    aliases = {
      ls = "ls -al";
    };
  };
}
