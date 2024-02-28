{ pkgs, ... }: {
  xdg.configFile."swaync/config.json".source = ./swaync/config.json;
  xdg.configFile."swaync/style.css".source = ./swaync/style.css;
}
