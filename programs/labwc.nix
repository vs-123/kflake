{
  enable = true; 
  autostart = [
    "swaybg -c 16161d &" 
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
  };
}
