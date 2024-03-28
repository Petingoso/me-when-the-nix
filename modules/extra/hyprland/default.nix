{
  inputs,
  lib,
  config,
  ...
}: {
  home-manager.users.${config.mystuff.username} = {
    wayland.windowManager.hyprland.enable = true;
    imports = [
      inputs.hypridle.homeManagerModules.default
      inputs.hyprlock.homeManagerModules.default

      ./hypridle.nix
      # ./hyprlock.nix
      # ./conf/binds.nix
      ./conf/exports.nix
      ./conf/settings.nix
      ./conf/startup.nix
    ];
  };
}
