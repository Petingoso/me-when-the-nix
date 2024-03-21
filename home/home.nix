{
  config,
  config',
  pkgs,
  lib,
  self,
  inputs,
  ...
}: {
  programs.dconf.enable = true;

  environment.sessionVariables = rec {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gnome.nixos-gsettings-overrides}/share/gsettings-schemas/nixos-gsettings-overrides/glib-2.0/schemas/";

    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];
  };

  #####################

  home-manager.extraSpecialArgs = {inherit inputs self config';};

  home-manager.users.${config'.username} = {
    imports = [./config];

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
      libsForQt5.qtstyleplugin-kvantum
      eza
      fzf
      xterm
      nh
      dunst
      libnotify
      btop
      ripgrep
      wtype
      wdisplays
    ];

    home.stateVersion = config.system.stateVersion;
  };
}
