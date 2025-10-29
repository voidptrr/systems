{pkgs, ...}: {
  programs.nixvim.plugins.treesitter = {
    enable = true;
    autoLoad = true;

    settings = {
      auto_install = false;
      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
    };
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      nix
      yaml
      json
      bash
      c
    ];
  };
}
