{...}: {
  programs.nixvim = {
    plugins.fugitive = {
      enable = true;
      autoLoad = true;
    };
  };
}
