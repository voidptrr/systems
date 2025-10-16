{pkgs, ...}: {
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
      set noswapfile
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
      nnoremap <leader>gs :Git<cr>
      nnoremap <leader>gm :Git commit<cr>
      nnoremap <leader>gr :Git rebase<cr>
      nnoremap <leader>gP :Git pull<cr>
      nnoremap <leader>gp :Git push<cr>


      " Status line
      set laststatus=2

      hi User1 ctermfg=green ctermbg=black
      hi User2 ctermfg=yellow ctermbg=black
      hi User3 ctermfg=red ctermbg=black
      hi User4 ctermfg=blue ctermbg=black
      hi User5 ctermfg=white ctermbg=black

      set statusline=
      set statusline +=%1*\ %n\ %*            "buffer number
      set statusline +=%5*%{&ff}%*            "file format
      set statusline +=%3*%y%*                "file type
      set statusline +=%4*\ %<%F%*            "full path
      set statusline +=%2*%m%*                "modified flag
      set statusline +=%2*%=%5l%*             "current line
      set statusline +=%2*/%L%*               "total lines
      set statusline +=%2*%4v\ %*             "virtual column number
      set statusline +=%2*0x%04B\ %*          "character under cursor
    '';
  };
}
