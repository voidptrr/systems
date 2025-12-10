{
  username,
  machine-options,
  shared-options,
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
    };
    sharedModules = [
      shared-options
      machine-options
      ./options
      ./config
    ];
  };
}
