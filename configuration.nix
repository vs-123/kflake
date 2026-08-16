{ config, lib, pkgs, ... }:

{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "kalium";

  networking.networkmanager.enable = true;

  time.timeZone = "Etc/UTC";

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  programs.zsh.enable = true;

  users.mutableUsers = false;
  users.users.root.initialPassword = "root";
  users.users.xe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialHashedPassword = "$y$j9T$/pz9fYtiJv5QQpo3bWGyM1$HtzBnyz.oXbsx67r0pU4jBUe9jJ214bXyOD0KXgagwD";
  };

  environment.systemPackages = with pkgs; [
    vim
    aria2
    git
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;

  services.xserver = {
    enable = false;
  };

  programs.labwc.enable = true;

  services.displayManager.ly.enable = true;
  services.ntp.enable = false;
  services.timesyncd.enable = false;

  environment.persistence."/nix/persist" = {
    hideMounts = true;

    directories = [
      "/etc/nixos"
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/NetworkManager"
    ];

    files = [
      "/etc/machine-id"
    ];
  };

  zramSwap = {
    enable = true; 
    memoryPercent = 50;
  };

  # COPY THE NIXOS CONFIGURATION FILE AND LINK IT FROM THE RESULTING SYSTEM
  # USEFUL IN CASE YOU DELETE CONFIGURATION.NIX.
  # /run/current-system/configuration.nix
  # system.copySystemConfiguration = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";

}

