{inputs,config, ...}: {
  programs.hyprland.enable = true;
  home-manager.users.${config.mystuff.username} = {
    wayland.windowManager.hyprland.enable = true;
    imports = [
      ./hypridle.nix
      ./hyprlock.nix
      ./conf/binds.nix
      ./conf/exports.nix
      ./conf/settings.nix
      ./conf/startup.nix
    ];
  };
}
