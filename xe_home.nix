{ pkgs, ... }: {
  home.packages = with pkgs; [
    cmatrix
    cowsay
  ];
  home.stateVersion = "26.11";
}
