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

  time.timeZone = "UTC";

  services.xserver = {
    enable = true;
    windowManager.openbox.enable = true;
  };

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.xe = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;


  # COPY THE NIXOS CONFIGURATION FILE AND LINK IT FROM THE RESULTING SYSTEM
  # USEFUL IN CASE YOU DELETE CONFIGURATION.NIX.
  # /run/current-system/configuration.nix
  # system.copySystemConfiguration = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "26.05";

}

