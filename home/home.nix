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

    home.packages = with pkgs; [
      nordic
      (callPackage ../pkgs/everforest.nix {})
      (callPackage ../pkgs/gruvbox.nix {})
      (callPackage ../pkgs/oomox-srcery.nix {})
      (callPackage ../pkgs/tokyonight.nix {})
      (callPackage ../pkgs/rose-pine.nix {})
      (catppuccin-gtk.override
        {
          accents = ["red"];
          variant = "macchiato";
        })
      numix-solarized-gtk-theme
      papirus-icon-theme
      eza
      fzf
      xterm
      nh
      dunst
      libnotify
    ];

    home.stateVersion = config.system.stateVersion;
  };
}
