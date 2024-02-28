{ config, config', pkgs, lib, self, inputs,... }:
{
environment.sessionVariables = rec {
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];
  };
home-manager.users.${config'.username} = {
  imports = [ ./config ];
  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus-Dark";
  };

  home.packages =
    [ pkgs.nixfmt pkgs.ranger pkgs.papirus-icon-theme pkgs.pam pkgs.zinit pkgs.nh pkgs.git pkgs.clang];
   
  
  home.stateVersion = config.system.stateVersion;
};
}
