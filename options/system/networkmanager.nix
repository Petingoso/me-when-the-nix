{
  lib,
  config,
  ...
}: {
  options.mystuff = {
    networkmanager.enable = lib.mkEnableOption "networkmanager";
  };

  config = lib.mkIf config.mystuff.networkmanager.enable {
    networking = {
      networkmanager = {
        enable = true;
        dns = "systemd-resolved";
      };
    };

    services.resolved = {
      enable = true;
      fallbackDns = [
        "9.9.9.9"
        "2620:fe::fe"
      ];
    };

    users.users.${config.mystuff.username}.extraGroups = ["networkmanager"];
  };
}
