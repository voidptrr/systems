{...}: {
  programs.nixvim.plugins.web-devicons.enable = false;
  programs.nixvim.plugins.telescope = {
    enable = true;
    autoLoad = true;

    keymaps = {
      "<leader>cd" = {
        action = "find_files";
        options.desc = "Telescope Find Files";
      };
      "<leader>gd" = {
        action = "git_files";
        options.desc = "Telescope Git Files";
      };
    };

    settings = {
      extensions = {
        fzf-native.enable = true;
      };
      pickers = {
        find_files = {
          theme = "ivy";
          disable_devicons = true;
        };
        git_files = {
          theme = "ivy";
          disable_devicons = true;
        };
      };
    };
  };
}
