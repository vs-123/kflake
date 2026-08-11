{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    bash = import ./programs/bash.nix;

    btop = {
      enable = true; 
      settings = {
        update_ms = 100; 
      };
    };

    fastfetch = import ./programs/fastfetch.nix;

    feh.enable = true;

    librewolf = {
      enable = true;
      profiles.pizza = {
        isDefault = true;
        settings = {
          "browser.tabs.inTitlebar" = 0;   # SHOULD NOT REPLACE NATIVE WINDOW BAR
        };
      };
    };

    git = import ./programs/git.nix;

    kitty = {
      enable = true;
    };

    rofi = {
      enable = true; 
      theme = "Paper";
    };

    qalculate = import ./programs/qalculate.nix;

    vim = {
      enable = true;
      defaultEditor = true;
      settings = {
        "number" = true;
        "relativenumber" = true;
        "mouse" = "a";
        "expandtab" = true;
      };
    };
  };

  xdg.configFile = {
    "openbox/rc.xml".source = ./dots/openbox/rc.xml;
    "openbox/menu.xml".source = ./dots/openbox/menu.xml;
    "openbox/autostart" = {
      source = ./dots/openbox/autostart;
      executable = true;
    };
  };

  services = {
    dunst = {
      enable = true;
    };

    flameshot = {
      enable = true; 
      settings = {
        General = {
          useX11LegacyScreenshot = true;
        };
      };
    };

    picom = {
      enable = true;
      vSync = true;
      settings = {
        backend = "xrender";
        corner-radius = 12; 
      };
    }; 
  };

  wayland.windowManager.labwc = import ./programs/labwc.nix;

  home.packages = with pkgs; [
    wdisplays 
    xset
    swaybg
  ];
}
