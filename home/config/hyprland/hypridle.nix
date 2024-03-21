{
  self,
  config,
  ...
}: {
  imports = ["${self}/home/variables.nix"];

  services.hypridle = {
    enable = true;
    lockCmd = config.lock_cmd;
    listeners = [
      {
        timeout = 500;
        onTimeout = config.lock_cmd;
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
    beforeSleepCmd = config.lock_cmd;
  };
}
