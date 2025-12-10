{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.hostPlatform.isLinux
      then pkgs.ghostty
      else pkgs.ghostty-bin;

    enableZshIntegration = true;
    settings = {
      theme = "Everforest Dark Hard";
      font-size = 14;
      font-thicken =  true;
      font-thicken-strength = 100;
      font-family = "JetBrains Mono";

      window-width = 144;
      window-height = 43;
    };
  };
}
