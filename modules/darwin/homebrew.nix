{...}: {
  flake.darwinModules.homebrew = {username, ...}: {
    nix-homebrew = {
      enable = true;
      enableRosetta = true;
      user = username;
    };

    homebrew = {
      enable = true;
      onActivation = {
        autoUpdate = true;
        upgrade = true;
        cleanup = "zap";
      };

      brews = ["mole"];

      casks = ["firefox"];

      masApps = {
        KakaoTalk = 869223134;
      };
    };
  };
}
