{
  plugins.lsp = let
    externalServer = {
      enable = true;
      package = null;
    };
  in {
    enable = true;
    keymaps = {
      lspBuf = {
        "K" = "hover";
        "<leader>ld" = "definition";
        "<leader>li" = "implementation";
        "<leader>lr" = "rename";
      };
    };
    servers = {
      nixd = {
        enable = true;
        settings = {
          formatting.command = ["alejandra"];
          nixpkgs.expr = "import <nixpkgs> {}";
          options = {
            darwin.expr = "(builtins.getFlake \"/private/etc/nix-darwin\").darwinConfigurations.personal.options";
            "home-manager".expr = "(builtins.getFlake \"/private/etc/nix-darwin\").darwinConfigurations.personal.options.home-manager";
          };
        };
      };

      yamlls = {
        enable = true;
        settings = {
          schemaStore.enable = true;
          validate = true;
          format.enable = true;
        };
      };

      rust_analyzer =
        externalServer
        // {
          installCargo = false;
          installRustc = false;
        };

      clangd = externalServer;
      ts_ls = externalServer;
    };
  };
}
