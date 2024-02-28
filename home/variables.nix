{ self, lib, ... }: {
  options = with lib;
    with types; {
      lock_cmd = mkOption { type = str; };
      rofi-menu = mkOption { type = str; };
      };
      config = {
        lock_cmd = "playerctl pause; hyprlock";
        rofi-menu =
          "rofi -show drun -theme ${self}/config/rofi/launchers/menu.rasi";
      };
}
