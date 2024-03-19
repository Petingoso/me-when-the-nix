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
    extraGroups = ["networkmanager" "wheel"];
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
  ];

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
