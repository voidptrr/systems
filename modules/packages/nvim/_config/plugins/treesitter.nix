{pkgs, ...}: {
  plugins.treesitter = {
    enable = true;
    highlight.enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      c
      javascript
      nix
      rust
      typescript
      yaml
    ];
  };
}
