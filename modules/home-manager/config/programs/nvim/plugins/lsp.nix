{...}: let
  nullServer = {
    enable = true;
    package = null;
  };
in {
  programs.nixvim.plugins = {

    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
          min_keyword_length = 2;
        };
      };
    };

    lsp = {
      enable = true;
      servers = {
        nixd.enable = true;
        clangd = nullServer;
        zls = nullServer;
        rust_analyzer = {
          enable = true;
          package = null;
          installCargo = false;
          installRustc = false;
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
          "<leader>r" = "rename";
          "lr" = "references";
          "ld" = "definition";
          "li" = "implementation";
          "lt" = "type_definition";
          "la" = "code_action";
        };
      };
    };
  };
}
