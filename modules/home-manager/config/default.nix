{pkgs, ...}: {
  home.packages = with pkgs; [obsidian];
  imports = [./programs];
}
