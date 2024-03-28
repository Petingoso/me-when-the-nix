{
  self,
  config,
  pkgs,
  ...
}: {
  home-manager.users.${config.mystuff.username} = {
    home.packages = [pkgs.glib pkgs.swaybg];
    home.file.".local/bin/theme_changer_WL" = {
      text = builtins.readFile ./theme.sh;
      executable = true;
    };
  };
}
