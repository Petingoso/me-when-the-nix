{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    exec = ["pkill waybar;waybar &"];
    exec-once = [
      "GDK_BACKEND=x11 pcloud"
      "swaync"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
      "fcitx5"
      "opensnitch-ui"
      "wl-clip-persist --clipboard regular"
      "/usr/lib/kdeconnectd"
    ];
  };
}
