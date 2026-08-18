{self, ...}: {
  enable = true; 
  autostart = [
    "swaybg -i ${self.wp-path} &"
  ];
  environment = [
    "TEST_VAR_WAYLAND=42" 
  ];
  rc = {
    theme = {
      titlebar.layout = "close,max,iconify:icon";
    };
    keyboard = {
      repeatRate = 50;
      repeatDelay = 225;
      keybind = [
        {
          "@key" = "W-Space";
          action = {
            "@name" = "Execute";
            "@command" = "rofi -show drun";
          };
        } 
        {
          "@key" = "W-r";
          action = {
            "@name" = "Reconfigure";
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
            "@name" = "Close";
          };
        } 
        {
          "@key" = "W-S-w";
          action = {
            "@name" = "Kill";
          };
        }
        #  CLIPBOARD
        {
          "@key" = "W-v";
          action = {
            "@name" = "Execute";
            "@command" = "sh -c 'cliphist list | rofi -dmenu | cliphist decode | wl-copy'";
          };
        } 
        #  WINDOW SWITCHER
        {
          "@key" = "W-Tab";
          action = {
            "@name" = "NextWindow";
          };
        }
        {
          "@key" = "W-S-Tab";
          action = {
            "@name" = "PreviousWindow";
          };
        }
        {
          "@key" = "W-m";
          action = {
            "@name" = "ToggleMaximize";
            "@direction" = "both";
          };
        } 
        #  WORKSPACES
        {
          "@key" = "W-1";
          action = {
            "@name" = "GoToDesktop";
            "@to" = "1";
          };
        } 
        {
          "@key" = "W-2";
          action = {
            "@name" = "GoToDesktop";
            "@to" = "2";
          };
        } 
        {
          "@key" = "W-3";
          action = {
            "@name" = "GoToDesktop";
            "@to" = "3";
          };
        } 
        {
          "@key" = "W-4";
          action = {
            "@name" = "GoToDesktop";
            "@to" = "4";
          };
        } 
        {
          "@key" = "W-S-1";
          action = {
            "@name" = "SendToDesktop";
            "@to" = "1";
          };
        } 
        {
          "@key" = "W-S-2";
          action = {
            "@name" = "SendToDesktop";
            "@to" = "2";
          };
        } 
        {
          "@key" = "W-S-3";
          action = {
            "@name" = "SendToDesktop";
            "@to" = "3";
          };
        } 
        {
          "@key" = "W-S-4";
          action = {
            "@name" = "SendToDesktop";
            "@to" = "4";
          };
        } 
      ]; 
    };
    mouse = {
      default = {};
      context = [
        {
          "@name" = "Frame";
          mousebind = [
            {
              "@button" = "W-Left";
              "@action" = "Drag";
              action = {
                "@name" = "Move"; 
              };
            } 
            {
              "@button" = "W-S-Left";
              "@action" = "Drag";
              action = {
                "@name" = "Resize"; 
              };
            } 
          ]; 
        }
        {
          "@name" = "Desktop";
          mousebind = [
            {
              "@button" = "Right";
              "@action" = "Click";
              action = {
                "@name" = "ShowMenu"; 
                "@menu" = "root-menu"; 
                atCursor = "yes";
              };
            } 
          ]; 
        }
      ];
    };
    desktops = {
      number = "4"; 
    };
  };
}
