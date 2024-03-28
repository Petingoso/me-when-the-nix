{
  pkgs,
  lib,
  config,
  ...
}: {
  options.mystuff = {
    swaync.enable = lib.mkEnableOption "swaync";
  };

  config = lib.mkIf config.mystuff.swaync.enable {
    home-manager.users.${config.mystuff.username} = {
      home.packages = [pkgs.swaynotificationcenter];
      xdg.configFile."swaync/config.json".source = ./config.json;
      xdg.configFile."swaync/style.css".source = ./style.css;
    };
  };
}
