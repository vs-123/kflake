{ pkgs, ... }: {
  home.stateVersion = "26.11";

  programs = {
    firefox.enable = true;
    neovim.enable = true;
    kitty.enable = true;
  };

  home.packages = with pkgs; [ ];
}
