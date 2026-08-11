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
}
