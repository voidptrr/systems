{username, ...}: {
  # Homebrew installation
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

    masApps = {
      KakaoTalk = 869223134;
    };
  };
}
