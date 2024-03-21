{
  pkgs,
  config',
  ...
}: {
  users.users.${config'.username}.packages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome.nixos-gsettings-overrides
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style.name = "kvantum";
  };
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.iconTheme = {
    package = pkgs.papirus-icon-theme;
    name = "Papirus-Dark";
  };
}
