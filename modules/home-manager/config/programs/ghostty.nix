{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package =
      if pkgs.stdenv.hostPlatform.isLinux
      then pkgs.ghostty
      else pkgs.ghostty-bin;

    enableZshIntegration = true;
    settings = {
      theme = "Kanagawa Dragon";
      font-size = 14;
      background-image = "/etc/nix-darwin/wallpapers/space1.png";
      background-image-opacity = 0.35;
      font-family = "JetBrains Mono";

      # I like terminal not full screen
      window-width = 144;
      window-height = 43;
    };
  };
}
