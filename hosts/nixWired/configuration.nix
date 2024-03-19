# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  lib,
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

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixWired"; # Define your hostname.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Lisbon";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_PT.UTF-8";
    LC_IDENTIFICATION = "pt_PT.UTF-8";
    LC_MEASUREMENT = "pt_PT.UTF-8";
    LC_MONETARY = "pt_PT.UTF-8";
    LC_NAME = "pt_PT.UTF-8";
    LC_NUMERIC = "pt_PT.UTF-8";
    LC_PAPER = "pt_PT.UTF-8";
    LC_TELEPHONE = "pt_PT.UTF-8";
    LC_TIME = "pt_PT.UTF-8";
  };
  # # Enable the X11 windowing system.
  # services.xserver.enable = true;
  #
  # # Enable the Budgie Desktop environment.
  # services.xserver.displayManager.lightdm.enable = true;
  # services.xserver.desktopManager.budgie.enable = true;

  # Configure keymap in X11
  # services.xserver.xkb = {
  #   layout = "pt";
  #   variant = "";
  # };

  # Configure console keymap
  console.keyMap = "pt-latin1";

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

  environment.systemPackages = with pkgs; [
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
