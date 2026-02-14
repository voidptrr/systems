{pkgs, ...}: let
  vantablack = pkgs.vimUtils.buildVimPlugin {
    pname = "vantablack.nvim";
    version = "main";
    src = pkgs.fetchFromGitHub {
      owner = "bjarneo";
      repo = "vantablack.nvim";
      rev = "main";
      sha256 = "sha256-rX3rIhV5wD9dsRj0J1KtYv2rpAFraN+wp6rdrLmp8dY=";
    };
  };
in {
  extraPlugins = [vantablack];
  extraConfigLua = ''
    require("vantablack").setup({
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      }
    })
    vim.cmd.colorscheme("vantablack")
  '';
}
