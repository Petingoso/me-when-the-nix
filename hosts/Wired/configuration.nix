# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
  config,
  self,
  ...
}: let
  patchelfFixes = pkgs.patchelfUnstable.overrideAttrs (_finalAttrs: _previousAttrs: {
    src = pkgs.fetchFromGitHub {
      owner = "Patryk27";
      repo = "patchelf";
      rev = "527926dd9d7f1468aa12f56afe6dcc976941fedb";
      sha256 = "sha256-3I089F2kgGMidR4hntxz5CKzZh5xoiUwUsUwLFUEXqE=";
    };
  });
  pcloudFixes = pkgs.pcloud.overrideAttrs (_finalAttrs:previousAttrs: {
    nativeBuildInputs = previousAttrs.nativeBuildInputs ++ [patchelfFixes];
  });
in {
  imports = [
    ../../modules/system/systemd-boot.nix
    ../../modules/system/bluetooth.nix
    ../../modules/system/fonts.nix
    ../../modules/system/oomd.nix
    ../../modules/system/polkit.nix
    ../../modules/system/pt_locale.nix
    ../../modules/system/sound.nix
    ../../modules/extra/hyprland
    ../../modules/extra/direnv.nix
    ../../modules/extra/fcitx.nix
    ../../modules/extra/kleopatra.nix
    ../../modules/extra/opensnitch.nix
    ../../modules/extra/opentabletdriver.nix
    ../../modules/extra/scripts
    # ../../modules/extra/libvirt.nix
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
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
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

  services.openafsClient.enable = true;
  services.openafsClient.cellName = "ist.utl.pt";
  security.krb5.enable = true;
  security.krb5.settings.libdefaults.default_realm = "IST.UTL.PT";

  programs.kdeconnect.enable = true;
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = ["${config.mystuff.username}"];
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    baobab
    btrbk
    compsize
    font-manager
    gnome-disk-utility
    libreoffice
    lxappearance
    mpv
    mpvScripts.mpris
    ncpamixer
    nemo
    nemo-fileroller
    piper
    qbittorrent
    xfce.ristretto
    p7zip
    wdisplays
    # mcomix
  ];

  users.users.${config.mystuff.username}.packages = with pkgs; [
    bitwarden
    calibre
    ckan
    dualsensectl
    evince
    fastfetch
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
    # miru
    (callPackage "${self}/pkgs/olympus/package.nix" {})
    (callPackage "${self}/pkgs/steam-run-ksp.nix" {})
    xdg-utils
    gamescope
    r2modman
    pcloudFixes
    fluidsynth
  ];
  # might be needed for open tablet driver to work?
  services.udev.extraRules = ''
    #   KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    # '';
}
