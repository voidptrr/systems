{inputs, ...}: {
  flake.homeManagerModules.nvim = {pkgs, ...}: {
    home.packages = [
      inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.nvim
    ];
  };
}
