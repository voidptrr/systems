{...}: {
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Git<CR>";
      key = "<leader>gs";
      options.silent = true;
    }
    {
      action = "<cmd>Git commit<CR>";
      key = "<leader>gm";
      options.silent = true;
    }
    {
      action = "<cmd>Git push<CR>";
      key = "<leader>gp";
      options.silent = true;
    }
    {
      action = "<cmd>Git pull<CR>";
      key = "<leader>gP";
      options.silent = true;
    }
  ];
}
