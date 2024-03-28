{
  config,
  lib,
  ...
}: {
  options.mystuff = {
    nixsettings.enable = lib.mkEnableOption "nix.settings";
  };

  config = lib.mkIf config.mystuff.nixsettings.enable {
    nix.settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
      trusted-users = [
        "root"
        "${config.mystuff.username}"
      ];
      auto-optimise-store = true;
      # keep-outputs = true;
      # keep-derivations = true;
    };
  };
}
