{pkgs, ...}: {
  programs.rofi.package = pkgs.rofi-wayland;
  programs.rofi = {
    enable = true;
    configPath = "";
  };

  xdg.configFile = {
    "rofi/config.rasi".source = ./rofi/config.rasi;

    "rofi/launchers/menu.rasi".source = ./rofi/launchers/menu.rasi;
    "rofi/launchers/power.rasi".source = ./rofi/launchers/power.rasi;
    "rofi/launchers/theme.rasi".source = ./rofi/launchers/theme.rasi;
    "rofi/launchers/shared/colors.rasi".source = ./rofi/launchers/shared/colors.rasi;
    "rofi/launchers/shared/fonts.rasi".source = ./rofi/launchers/shared/fonts.rasi;
  };
}
