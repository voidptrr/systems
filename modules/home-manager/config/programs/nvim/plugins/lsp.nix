{...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      clangd = {
        enable = true;
        package = null;
      };
      zls = {
        enable = true;
        package = null;
      };
    };

    keymaps = {
      silent = true;
      diagnostic = {
        "<leader>d" = "open_float";
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
        "<leader>q" = "setqflist";
      };

      lspBuf = {
        "<leader>K" = "hover";
        "lr" = "references";
        "ld" = "definition";
        "li" = "implementation";
        "lt" = "type_definition";
        "la" = "code_action";
      };
    };
  };
}
