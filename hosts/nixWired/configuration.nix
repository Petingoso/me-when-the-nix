# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  config',
  ...
}: {
  #legion 5 shit
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  hardware.nvidia.prime = {
    amdgpuBusId = lib.mkForce "PCI:5:0:0"; ##override nixosHardware option
  };
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  ####
  programs.hyprland.enable = true;
  programs.light = {
    enable = true;
    brightnessKeys.enable = true;
  };
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.kernelPackages = pkgs.linuxPackages_zen;

  programs.kdeconnect.enable = true;

  environment.systemPackages = with pkgs; [
    baobab
    btrbk
    compsize
    font-manager
    gnome.gnome-disk-utility
    libreoffice
    lxappearance
    mpv
    mpvScripts.mpris
    ncpamixer
    cinnamon.nemo
    cinnamon.nemo-fileroller
    opensnitch-ui
    linuxKernel.packages.linux_zen.opensnitch-ebpf
    opentabletdriver
    piper
    psensor
    qbittorrent
    mcomix
  ];
  users.users.${config'.username}.packages = with pkgs; [
    bitwarden
    calibre
    ckan
    dualsensectl
    evince
    heroic
    hydrus
    input-remapper
    krita
    lutris
    neofetch
    pavucontrol
    pcsx2
    osu-lazer-bin
    prismlauncher
    qalculate-gtk
    steam
    steamtinkerlaunch
    stremio
    texliveMedium
    tor-browser
    ungoogled-chromium
    vesktop
    vscodium
    wineWowPackages.waylandFull
    youtube-music
    miru
  ];

  system.stateVersion = "23.11"; 
}
