{
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./firefox
    ./kitty
    ./nvim
    ./ranger
    ./themes
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

    home-manager.users.${config.mystuff.username} = {
      home.stateVersion = config.system.stateVersion;
    };
  };
}
