{...}: {
  flake.darwinModules."quantum" = {username, ...}: {
    home-manager.users.${username}.programs.gitProfile = {
      name = "voidptrr";
      email = "bruno.tommaso@protonmail.com";
    };
  };
}
