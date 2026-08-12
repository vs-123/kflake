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

    vesktop = import ./programs/vesktop.nix;
  };

  xdg.configFile = { };

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

    kanshi = {
      enable = true; 
      systemdTarget = "labwc-session.target";
    };
  };

  wayland.windowManager.labwc = import ./programs/labwc.nix;

  home.packages = with pkgs; [
    wdisplays 
    xset
    swaybg
  ];
}
