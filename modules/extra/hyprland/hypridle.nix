{
  pkgs,
  config,
  ...
}: let
  lock_cmd = "${pkgs.playerctl}/bin/playerctl pause; ${config.programs.hyprlock.package}/bin/hyprlock";
in {
  services.hypridle = {
    enable = true;
    settings = {
      lockCmd = lock_cmd;
      listeners = [
        {
          timeout = 500;
          onTimeout = lock_cmd;
          onResume = "";
        }
        {
          timeout = 600;
          onTimeout = "systemctl suspend";
          onResume = "";
        }
      ];
      unlockCmd = "";
      afterSleepCmd = "";
      beforeSleepCmd = lock_cmd;
    };
  };
}
