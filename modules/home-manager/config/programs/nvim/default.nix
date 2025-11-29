{pkgs, ...}: {
  programs.nixvim = {
    enable = true;
    package = pkgs.neovim;
    enableMan = true;

    viAlias = true;
    vimAlias = true;

    opts = import ./options.nix;
    globals = {
      mapleader = ",";
      maplocalleader = ",";
    };

    files = {
      "ftplugin/nix.lua" = {
        opts = {
          shiftwidth = 2;
          tabstop = 2;
          softtabstop = 2;
        };
      };
      "ftplugin/md.lua" = {
        opts = {
          conceallevel = 1;
          colorcolumn = "";
        }; 
      };
    };

    colorschemes.everforest = {
      enable = true;
      settings = {
        background = "hard";
        transparent_background = 1;
      };
    };
  };

  imports = [./plugins ./keymaps.nix];
}
