{self,config,... }: {
imports = ["${self}/variables.nix"];

  services.hypridle.enable = true;
  services.hypridle.lockCmd = config.lock_cmd;
  services.hypridle.listeners = [
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
  services.hypridle.unlockCmd = "";
  services.hypridle.afterSleepCmd = "";
  services.hypridle.beforeSleepCmd = config.lock_cmd;

}
