{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = if pkgs.stdenv.hostPlatform.isLinux then pkgs.ghostty else pkgs.ghostty-bin;
    enableZshIntegration = true;

    settings = {
      theme = "Gruvbox Dark Hard";
      font-size = 14;
      font-family = "JetBrains Mono";

      # Enforce bold font rendering
      font-style = "Bold";
      font-style-bold = "Bold";
      font-style-italic = "Bold Italic";
      font-style-bold-italic = "Bold Italic";

      # I like small terminal
      window-width = 117;
      window-height = 36;
    };
  };
}
