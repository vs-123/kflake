{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    firefox.enable = true;
    neovim.enable = true;
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
  };

  home.packages = with pkgs; [ ];
}
