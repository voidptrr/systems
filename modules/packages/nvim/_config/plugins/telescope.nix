{lib, ...}: {
  plugins = {
    web-devicons.enable = lib.mkForce false;
    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          layout_strategy = "bottom_pane";
          layout_config = {
            prompt_position = "bottom";
          };
        };
        pickers = {
          find_files.disable_devicons = true;
          git_files.disable_devicons = true;
          grep_string.disable_devicons = true;
        };
        extensions = {
          wrap_results = true;
        };
      };
      keymaps = {
        "<leader>cd" = "find_files";
        "<leader>gd" = "git_files";
        "<leader>cw" = "grep_string";
      };
    };
  };
}
