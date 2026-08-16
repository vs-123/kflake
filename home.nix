{ pkgs, self, ... }: {
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
      settings = {
        cursor_trail = 3;
        cursor_trail_decay = "0.10 0.25";
        cursor_shape = "block";
      };
    };

    rofi = {
      enable = true; 
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
      settings = {
        global.font = "Monospace 14"; 
        global.width = "(200,500)";
      };
    };

    flameshot = {
      enable = true; 
    };

    kanshi = {
      enable = true; 
      systemdTarget = "labwc-session.target";
    };
  };

  wayland.windowManager.labwc = import ./programs/labwc.nix {inherit self;}; 

  home.packages = with pkgs; [
    wdisplays 
    swaybg
    ntp
  ];

  home.persistence."/nix/persist" = {
    directories = [
      "my_stuff" 
      ".config/kanshi" 
      ".config/vesktop" 
      { directory = ".ssh"; mode = "0700"; }
    ]; 
    files = [ ];
  };

  stylix.targets = {
    librewolf.enable = false;
    rofi.enable = true;
    kitty.enable = true;
  };
}
