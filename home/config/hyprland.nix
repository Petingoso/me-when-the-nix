{ config, pkgs, ... }: {
  wayland.windowManager.hyprland.enable = true;
  imports = [
    ./hyprland/binds.nix
    ./hyprland/exports.nix
    ./hyprland/settings.nix
    ./hyprland/startup.nix
    ./hyprland/hypridle.nix
    ./hyprland/hyprlock.nix
  ];
}
