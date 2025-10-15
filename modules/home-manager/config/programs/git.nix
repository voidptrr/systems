{ ... }:
{
  programs.git = {
    enable = true;

    userName = "voidptrr";
    userEmail = "bruno.tommaso@protonmail.com";
    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      safe.directory = "/etc/nix-darwin";
    };
  };
}
