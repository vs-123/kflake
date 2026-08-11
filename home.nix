{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        "c" = "cd";
        "cl" = "clear";
        "em" = "$EDITOR";
        "ff" = "fastfetch";
        "g" = "git";
        "gps" = "git push";
        "ls" = "ls -a -F --color=auto";
        "ll" = "ls -l";
        "mkd" = "mkdir -p";

        ".." = "cd ..";
        "." = "ls";
      };
      bashrcExtra = ''
        cf() {
          query="$1"
          cd $(echo **/$query* | awk 'BEGIN { FS=" " } { print $1 }')
        } 
      '';
    };

    btop = {
      enable = true; 
      settings = {
        update_ms = 100; 
      };
    };

    fastfetch = 
      {
        enable = true;
        settings.modules = [
          "title"
          "separator"
          "os"
          "kernel"
          "uptime"
          "packages"
          "shell"
          {
            type = "de";
          }
          {
            type = "wm";
            detectPlugin = true;
          }
          {
            type = "wmtheme";
          }
          {
            type = "theme";
          }
          "terminal"
          "memory"
          "swap"
          "disk"
          {
            type = "localip";
            format = "0.0.0.0";
          }
          "battery"
          "locale"
        ];
      };


    feh = {
      enable = true; 
    };

    librewolf = {
      enable = true;
      profiles.pizza = {
        isDefault = true;
        settings = {
          "browser.tabs.inTitlebar" = 0;   # SHOULD NOT REPLACE NATIVE WINDOW BAR
        };
      };
    };

    git = {
      enable = true;
      settings = {
        user = {
          name = "vs-123";
          email = ""; 
        };
        url = {
          "ssh://git@github.com/" = {
            pushInsteadOf = "https://github.com/";
          }; 
        };
        alias = {
          a = "add";
          aa = "add -A";
          b = "branch";
          bm = "branch -M";
          bd = "branch -D";
          c = "commit";
          ca = "commit --all";
          cam = "commit --all -m";
          cfg = "config";
          ch = "checkout";
          cl = "clone";
          cld = "clone --depth 1";
          clr = "clone --recurse";
          cldr = "clone --depth 1 --recurse";
          clrd = "clone --depth 1 --recurse";
          d = "diff";
          dh = "diff HEAD";
          do = "diff origin/main";
          dt = "difftool -y";
          dto = "difftool -y origin";
          f = "fetch";
          gcfg = "config --global";
          lr = "log --reverse";
          l = "log";
          pl = "pull";
          plr = "pull --rebase";
          ps = "push";
          psu = "push -u";
          psf = "push -f";
          rb = "rebase";
          rba = "rebase --abort";
          rbc = "rebase --continue";
          rbi = "rebase -i --committer-date-is-author-date";
          rbir = "rebase -i --root --committer-date-is-author-date";
          rem = "remote";
          rema = "remote add";
          remr = "remote remove";
          rmc = "rm --cache";
          rs = "reset";
          rsh = "reset --hard";
          st = "status";
          sw = "switch";
        };
      };
    };

    kitty = {
      enable = true;
    };

    rofi = {
      enable = true; 
      theme = "Paper";
    };

    qalculate = {
      enable = true;
      settings = {
        General = {
          colorize = 1;
          precision = 20;
          save_definitions_on_exit = 0;
        };
        Mode = {
          calculate_as_you_type = 1; 
          number_base = 10;
        }; 
      };
    };

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

  wayland.windowManager.labwc = {
    enable = true; 
    environment = [
      "TEST_VAR_WAYLAND=42" 
    ];
    rc = {
      theme = {
        titlebar.layout = "close,max,iconify:icon";
      };
      keyboard = {
        keybind = [
          {
            "@key" = "W-Space";
            action = {
              "@name" = "Execute";
              "@command" = "rofi -show drun";
            };
          } 
          {
            "@key" = "W-S-s";
            action = {
              "@name" = "Execute";
              "@command" = "flameshot gui";
            };
          } 
          {
            "@key" = "W-w";
            action = {
              "@name" = "Kill";
            };
          } 
          {
            "@key" = "W-m";
            action = {
              "@name" = "ToggleMaximize";
              "@direction" = "both";
            };
          } 
          {
            "@key" = "W";
            action = {
              "@name" = "Move";
            };
          } 
          {
            "@key" = "W-S";
            action = {
              "@name" = "Resize";
            };
          } 
        ]; 
      };
    };
  };

  home.packages = with pkgs; [
    wdisplays 
    xset
  ];
}
