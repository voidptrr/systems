{
  plugins.oil = {
    enable = true;
    settings = {
      view_options = {
        show_hidden = true;
        columns = [];
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "-";
      action = "<cmd>Oil<cr>";
      options.desc = "Open Oil";
    }
  ];
}
