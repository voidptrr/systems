{...}: {
  flake.homeManagerModules.nvim = {
    pkgs,
    config,
    ...
  }: let
    nvimSl = config.lib.file.mkOutOfStoreSymlink "/etc/nix-darwin/xdg/nvim";
  in {
    xdg.configFile."nvim".source = nvimSl;
    programs.neovim = {
      enable = true;

      viAlias = true;
      vimAlias = true;
      extraPackages = with pkgs; [fzf lua-language-server nixd];
      plugins = with pkgs.vimPlugins; [
        oil-nvim
        lualine-nvim
        telescope-fzf-native-nvim
        telescope-nvim
        colorbuddy-nvim
        everforest
        nvim-lspconfig

        # Completion
        luasnip
        lspkind-nvim
        nvim-cmp
        cmp-nvim-lsp
        cmp-buffer
        cmp-path
      ];
    };
  };
}
