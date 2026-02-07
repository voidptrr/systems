{...}: {
  flake.homeManagerModules.git = {...}: {
    programs.git = {
      enable = true;

      signing = {
        signByDefault = true;
        key = "~/.ssh/id_ed25519.pub";
        format = "ssh";
      };

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
  };
}
