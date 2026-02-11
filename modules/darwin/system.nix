{...}: {
  flake.darwinModules.system = {
    pkgs,
    username,
    ...
  }: {
    programs.zsh.enable = true;
    environment = {
      shells = [pkgs.zsh];
      pathsToLink = ["/share/zsh"];
    };

    users.users.${username} = {
      name = username;
      home = "/Users/${username}";
      shell = pkgs.zsh;
    };

    fonts.packages = with pkgs; [source-code-pro];

    system = {
      stateVersion = 6;
      primaryUser = username;
      keyboard = {
        enableKeyMapping = true;
        remapCapsLockToEscape = true;
      };
      defaults = {
        NSGlobalDomain = {
          AppleIconAppearanceTheme = "RegularDark";
          AppleInterfaceStyle = "Dark";
          AppleShowScrollBars = "WhenScrolling";
          AppleTemperatureUnit = "Celsius";
          NSAutomaticCapitalizationEnabled = false;
          NSDocumentSaveNewDocumentsToCloud = false;
          NSAutomaticWindowAnimationsEnabled = false;
        };
        SoftwareUpdate.AutomaticallyInstallMacOSUpdates = false;

        WindowManager = {
          StageManagerHideWidgets = true;
          StandardHideDesktopIcons = true;
          StandardHideWidgets = true;
        };

        dock = {
          autohide = true;
          launchanim = false;
          magnification = false;
          minimize-to-application = true;
          mineffect = null;
          orientation = "bottom";
          persistent-apps = with pkgs; [
            {app = "/System/Applications/Music.app";}
            {app = "/Applications/Kakaotalk.app";}
            {app = "/Applications/Firefox.app";}
            {
              app = "${
                (
                  if stdenv.hostPlatform.isDarwin
                  then ghostty-bin
                  else ghostty
                )
              }/Applications/Ghostty.app";
            }
          ];
          show-recents = false;
          tilesize = 48;
        };

        finder = {
          AppleShowAllExtensions = true;
          AppleShowAllFiles = true;
          CreateDesktop = false;
          FXDefaultSearchScope = "SCcf";
          FXEnableExtensionChangeWarning = false;
          FXPreferredViewStyle = "clmv";
          FXRemoveOldTrashItems = true;
          NewWindowTarget = "Home";
          ShowPathbar = true;
          ShowStatusBar = true;
          _FXShowPosixPathInTitle = true;
        };

        loginwindow = {
          GuestEnabled = false;
          SHOWFULLNAME = false;
        };

        CustomSystemPreferences = {
          "com.apple.AdLib" = {
            allowApplePersonalizedAdvertising = false;
            allowAssistant = false;
          };
        };
      };
    };
  };
}
