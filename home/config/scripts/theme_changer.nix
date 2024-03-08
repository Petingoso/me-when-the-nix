{
  self,
  config,
  pkgs,
  ...
}: {
  home.packages = [pkgs.glib];
  home.file.".local/bin/theme_changer_WL" = {
    text = builtins.readFile ./theme.sh;
    executable = true;
  };
}
