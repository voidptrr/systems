{...}: {
  flake.darwinModules.quantum = {...}: {
    home-manager.sharedModules = [
      {
        programs.gitProfile = {
          name = "voidptrr";
          email = "bruno.tommaso@protonmail.com";
        };
      }
    ];
  };
}
