{...}: {
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
      yaml_parser = "native";
      templates = {
        subdir = "templates";
        time_format = "%H:%M";
      };
      workspaces = [
        {
          name = "personal";
          path = "~/obsidian/personal";
        }
      ];
    };
  };
}
