{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd = {
        enable = true;
        settings = {
          formatting.command = ["alejandra"];
          nixpkgs.expr = "import <nixpkgs> {}";
          options = {
            darwin.expr =
              "(builtins.getFlake \"/private/etc/nix-darwin\").darwinConfigurations.personal.options";
            "home-manager".expr =
              "(builtins.getFlake \"/private/etc/nix-darwin\").darwinConfigurations.personal.options.home-manager";
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
    };
  };
}
