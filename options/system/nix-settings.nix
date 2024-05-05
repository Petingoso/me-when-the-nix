{
  config,
  lib,
  self,
  ...
}: {
  options.mystuff = {
    nixsettings.enable = lib.mkEnableOption "nix.settings";
  };

  config = lib.mkIf config.mystuff.nixsettings.enable {
    nixpkgs.config.allowUnfree = true;
    environment.etc."nixos/current".source = lib.cleanSource "${self}";
    system.configurationRevision = self.dirtyRev;

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
