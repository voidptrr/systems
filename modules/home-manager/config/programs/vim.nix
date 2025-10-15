{ pkgs, ... }:
{
  programs.vim = {
    enable = true;
    defaultEditor = true;

    settings = {
      background = "dark";
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
    };

    plugins = with pkgs.vimPlugins; [
      vim-fugitive
      fzf-vim
    ];

    extraConfig = ''
      " Options
      set softtabstop=4
      set smartindent
      set nohlsearch
      set incsearch
      set nowrap
      set scrolloff=8

      " Colors
      syntax on
      set termguicolors
      colorscheme retrobox 

      filetype plugin indent on

      " Key bindings
      let mapleader = ","

      " Fzf
      nnoremap <leader>cd :Files<cr>
      nnoremap <leader>gd :GitFiles<cr>

      " Git
      nnoremap <leader>g :Git<cr>
      nnoremap <leader>gr :Git rebase<cr>
      nnoremap <leader>gP :Git pull<cr>
      nnoremap <leader>gp :Git push<cr>
    '';
  };
}
