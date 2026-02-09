{
  viAlias = true;
  vimAlias = true;

  globals = {
    mapleader = ",";
    maplocalleader = ",";
  };

  opts = {
    background = "dark";
    number = true;
    relativenumber = true;
    signcolumn = "yes";

    shiftwidth = 4;
    tabstop = 4;
    softtabstop = 4;
    expandtab = true;

    smartcase = true;
    ignorecase = true;

    splitbelow = true;
    splitright = true;

    swapfile = false;
    wrap = true;
    linebreak = true;
    inccommand = "split";
    title = true;
    titlestring = "%t%( %M%)%( (%{expand(\"%:~:h\")})%)%a (nvim)";
  };

  files = {
    "ftplugin/nix.lua" = {
      opts = {
        shiftwidth = 2;
        tabstop = 2;
        softtabstop = 2;
      };
    };
  };
}
