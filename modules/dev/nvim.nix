{inputs, ...}: {
  flake.homeManagerModules.nvim = {pkgs, ...}: {
    home.packages = [
      inputs.self.packages.${pkgs.system}.nvim
    ];
  };
}
