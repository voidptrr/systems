{...}: {
  programs.git = {
    enable = true;

    settings = {
      user = {
        username = "voidptrr";
        email = "bruno.tommaso@protonmail.com";
      };
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      safe.directory = "/etc/nix-darwin";
    };
  };
}
