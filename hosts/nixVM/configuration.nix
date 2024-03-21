# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  config',
  pkgs,
  inputs,
  self,
  ...
}: {
  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/vda";
  boot.loader.grub.useOSProber = true;

  environment.systemPackages = with pkgs; [
    sway
    dbus
  ];
  services.dbus.enable = true;
  programs.sway.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  system.stateVersion = "23.11"; # Did you read the comment?
}
