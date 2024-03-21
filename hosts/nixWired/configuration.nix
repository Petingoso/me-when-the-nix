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
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.editor = false;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixWired"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;
  services.opensnitch = {
    enable = true;
    rules = {
      systemd-timesyncd = {
        name = "systemd-timesyncd";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-timesyncd";
        };
      };
      systemd-resolved = {
        name = "systemd-resolved";
        enabled = true;
        action = "allow";
        duration = "always";
        operator = {
          type = "simple";
          sensitive = false;
          operand = "process.path";
          data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-resolved";
        };
      };
    };
  };

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-rime
      fcitx5-configtool
    ];
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = false; # powers up the default Bluetooth controller on boot
  services.blueman.enable = true;
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

  system.stateVersion = "23.11"; # Did you read the comment?
}
