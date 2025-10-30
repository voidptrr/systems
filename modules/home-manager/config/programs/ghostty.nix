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
      font-family = "JetBrains Mono";

      # I like terminal not full screen
      window-width = 144;
      window-height = 43;
    };
  };
}
