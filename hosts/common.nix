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
  nix.settings.experimental-features = ["nix-command" "flakes"];
  users.users.${config'.username} = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel" "video"];
  };
  programs.dconf.enable = true;
  security.polkit.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome.nixos-gsettings-overrides
    alejandra
    git
    polkit_gnome
    pam
    neovim
    bat 
    lynx
  ];
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
  # Configure console keymap
  console.keyMap = "pt-latin1";

  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gnome.nixos-gsettings-overrides}/share/gsettings-schemas/nixos-gsettings-overrides/glib-2.0/schemas/";
    EDITOR = "nvim";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka"];})
  ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
