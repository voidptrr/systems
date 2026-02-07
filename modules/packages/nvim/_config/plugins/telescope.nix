{
  plugins.web-devicons.enable = false;
  plugins.telescope = {
    enable = true;
    extensions.fzf-native.enable = true;
    settings = {
      extensions = {
        wrap_results = true;
        fzf = {};
      };
    };
    keymaps = {
      "<leader>cd" = "find_files";
      "<leader>gd" = "git_files";
      "<leader>cw" = "grep_string";
    };
  };
}
