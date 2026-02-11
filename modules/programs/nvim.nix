{self, ...}: {
  flake.homeManagerModules.nvim = {pkgs, ...}: {
    home.packages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
    ];
  };
}
