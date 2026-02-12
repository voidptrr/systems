{...}: {
  flake.darwinModules.quantum = {...}: {
    homebrewConfig = {
      brews = ["mole"];
      casks = ["firefox"];
      masApps = {
        KakaoTalk = 869223134;
      };
    };
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
