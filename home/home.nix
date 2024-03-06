{
  config,
  config',
  pkgs,
  lib,
  self,
  inputs,
  ...
}: {
  environment.sessionVariables = rec {
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };
  home-manager.extraSpecialArgs = {inherit inputs self config';};

  home-manager.users.${config'.username} = {
    imports = [./config];
    gtk.iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };

    home.packages = with pkgs; [alejandra papirus-icon-theme pam nh git clang eza fzf xterm];

    home.stateVersion = config.system.stateVersion;
    wayland.windowManager.sway = {
      enable = true;
      config = rec {
        modifier = "Mod4";
        # Use kitty as default terminal
        terminal = "xterm";
        startup = [
          {command = "xterm";}
        ];
      };
    };
  };
}
