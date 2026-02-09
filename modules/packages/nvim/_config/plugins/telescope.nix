{
  plugins = {
    web-devicons.enable = false;
    telescope = {
      enable = true;
      extensions.fzf-native.enable = true;
      settings = {
        defaults = {
          disable_devicons = true;
          layout_strategy = "bottom_pane";
          layout_config = {
            prompt_position = "bottom";
          };
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
