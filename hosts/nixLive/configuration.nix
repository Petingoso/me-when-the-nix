# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  config',
  ...
}: {
  isoImage.squashfsCompression = "zstd -Xcompression-level 10";
  boot.kernelPackages = pkgs.linuxPackages_zen;
  programs.hyprland.enable = true;
  programs.light = {
    enable = true;
    brightnessKeys.enable = true;
  };
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # Use the systemd-boot EFI boot loader.

  environment.systemPackages = with pkgs; [
    gparted
    mpv
    mpvScripts.mpris
    ncpamixer
    cinnamon.nemo
    cinnamon.nemo-fileroller
    qbittorrent
    mcomix
  ];
  users.users.${config'.username}.packages = with pkgs; [
    bitwarden
    evince
    krita
    pavucontrol
    qalculate-gtk
    ungoogled-chromium
  ];

  system.stateVersion = "23.11";
}
