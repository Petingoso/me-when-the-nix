{
  inputs,
  config,
  ...
}: {
  programs.hyprland.enable = true;
  home-manager.users.${config.mystuff.username} = {
    imports = [
      inputs.hyprland.homeManagerModules.default
      ./hypridle.nix
      ./hyprlock.nix
      ./conf/binds.nix
      ./conf/exports.nix
      ./conf/settings.nix
      ./conf/startup.nix
    ];
    wayland.windowManager.hyprland.enable = true;
  };
}
