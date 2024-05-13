{osConfig, ...}: {
  wayland.windowManager.hyprland.settings.env = [
    "CLUTTER_BACKEND,wayland"
    "XDG_SESSION_TYPE,wayland"

    "GDK_BACKEND,nvidia-drm"
    "NVD_BACKEND,direct"

    "QT_IM_MODULE,fcitx"
    "GLFW_IM_MODULE,ibus"
    "SDL_IM_MODULE,fcitx"

    "FLAKE,/home/${osConfig.mystuff.username}/flake"
  ];
}
