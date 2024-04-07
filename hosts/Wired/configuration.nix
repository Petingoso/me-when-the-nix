# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ../../modules/system/systemd-boot.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/fonts.nix
    ../../modules/system/oomd.nix
    ../../modules/system/polkit.nix
    ../../modules/system/pt_locale.nix
    ../../modules/system/sound.nix
    ../../modules/extra/hyprland
    ../../modules/extra/fcitx.nix
    ../../modules/extra/opensnitch.nix
    ../../modules/extra/opentabletdriver.nix
    ../../modules/extra/scripts
  ];
  system.stateVersion = "23.11";

  mystuff.hostname = "Wired";
  mystuff.username = "petnix";
  mystuff = {
    networkmanager.enable = true;
    nixsettings.enable = true;

    home-manager.enable = true;
    firefox-config.enable = true;
    gtk.enable = true;
    kitty.enable = true;
    nvim-config.enable = true;
    qt.enable = true;
    ranger.enable = true;
    rofi.enable = true;
    swaync.enable = true;
    waybar.enable = true;
    zsh.enable = true;
    zsh.zinit.enable = true;
  };
  #####
  #legion 5 shit
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    prime.amdgpuBusId = lib.mkForce "PCI:5:0:0"; ##override nixosHardware option
    powerManagement.enable = true;
  };
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  specialisation = {
    disable-dGPU = {
      configuration = {
        system.nixos.tags = ["no-dGPU"];
        hardware.nvidiaOptimus.disable = true;
      };
    };
  };
  programs.light = {
    enable = true;
    brightnessKeys.enable = true;
  };
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  # Use the systemd-boot EFI boot loader.

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
    piper
    qbittorrent
    xfce.ristretto
    # mcomix
  ];
  users.users.${config.mystuff.username}.packages = with pkgs; [
    bitwarden
    calibre
    ckan
    dualsensectl
    evince
    heroic
    # hydrus
    krita
    lutris
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
}
