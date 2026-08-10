{ pkgs, ... }: {
  home.packages = with pkgs; [
    kitty
    neovim
  ];
  home.stateVersion = "26.11";

  programs.firefox.enable = true;
}
