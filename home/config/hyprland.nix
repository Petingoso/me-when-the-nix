{inputs, ...}: {
  wayland.windowManager.hyprland.enable = true;
  imports = [
    inputs.hypridle.homeManagerModules.default
    inputs.hyprlock.homeManagerModules.default
    ./hyprland/binds.nix
    ./hyprland/exports.nix
    ./hyprland/settings.nix
    ./hyprland/startup.nix
    ./hyprland/hypridle.nix
    ./hyprland/hyprlock.nix
  ];
}
