{
  lib,
  pkgs,
  config,
  ...
}: {
  options = with lib;
  with types; {
    lock_cmd = mkOption {type = str;};
    rofi-menu = mkOption {type = str;};
  };
  config = {
    lock_cmd = "${pkgs.playerctl}/bin/playerctl pause; ${config.programs.hyprlock.package}/bin/hyprlock";
    rofi-menu = "rofi -show drun -theme ~/.config/rofi/launchers/menu.rasi";
  };
}
