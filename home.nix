{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    firefox.enable = true;
    kitty.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        "cl" = "clear";
        "em" = "$EDITOR";
        "g" = "git";
        "ll" = "ls -l";
        "ls" = "ls -a -F --color=auto";

        ".." = "cd ..";
        "." = "ls";
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

  home.packages = with pkgs; [ ];
}
