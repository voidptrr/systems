{
  username,
  nixvim,
  machine-options,
  shared-options,
  pkgs,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.${username} = {
      home.username = username;
      home.stateVersion = "25.11";
      home.homeDirectory = "/Users/${username}";

      programs.home-manager.enable = true;
      home.packages = with pkgs; [fzf ripgrep];
    };
    sharedModules = [
      nixvim.homeModules.nixvim
      shared-options
      machine-options
      ./options
      ./config
    ];
  };
}
