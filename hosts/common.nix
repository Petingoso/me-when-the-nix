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
  security.polkit.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    polkit_gnome
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    (nerdfonts.override {fonts = ["JetBrainsMono" "Iosevka"];})
  ];
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
