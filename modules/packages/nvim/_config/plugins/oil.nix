{
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "size"
      ];
      view_options = {
        show_hidden = true;
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
