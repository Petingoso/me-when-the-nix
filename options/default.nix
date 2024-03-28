{
  lib,
  config,
  ...
}: {
  imports = [./system ./home];

  options.mystuff = {
    hostname = lib.mkOption {
      description = "hostname for this system";
      type = lib.types.str;
    };

    username = lib.mkOption {
      description = "username for this system (doesn't support multi user yet)";
      type = lib.types.str;
    };
  };

  config = {
    networking.hostName = config.mystuff.hostname;

    users.users.${config.mystuff.username} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
    };
  };
}
