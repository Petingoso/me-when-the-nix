{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager

    ./themes.nix
    ./kitty
    ./zsh
  ];
  options.mystuff = {
    home-manager.enable = lib.mkEnableOption "home-manager";
  };
  config = lib.mkIf config.mystuff.home-manager.enable {
    environment.sessionVariables = rec {
      XDG_BIN_HOME = "$HOME/.local/bin";
      PATH = [
        "${XDG_BIN_HOME}"
      ];
    };
    home.stateVersion = config.system.stateVersion;
  };
}
