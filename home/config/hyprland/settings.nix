{ config, pkgs, ... }: {

  wayland.windowManager.hyprland.settings = {
    source = "/tmp/themes/hyprland/hypr_theme";

    monitor = ",preferred,auto,1";

    input = {
      kb_layout = "pt";
      follow_mouse = 1;
      force_no_accel = true;
      natural_scroll = false;

      touchpad.disable_while_typing = false;

    };

    gestures = {
      workspace_swipe = true;
      workspace_swipe_invert = true;
    };

    general = {
      sensitivity = 1;

      gaps_in = 5;
      gaps_out = 5;
      border_size = 2;
      layout = "dwindle";
    };

    dwindle = { preserve_split = true; };

    master = { new_is_master = false; };

    animations = { enabled = 1; };

    decoration = {
      rounding = 3;
      blur.enabled = true;
      blur.size = 8;
      blur.passes = 2;
      blur.new_optimizations = true;
      blur.ignore_opacity = true;
      blur.xray = true;

      drop_shadow = 1;
      shadow_range = 20;
      shadow_render_power = 2;
      shadow_ignore_window = 1;
      shadow_offset = "8 8";
     "col.shadow" = "0x44000000";
    };

    # misc.disable_hyprland_logo = true;
    misc.vfr = true;

    windowrule = [
      "opacity 0.95,^(discord)$"
      "opacity 1,^(NoteKit)$"
      "tile,^(huiontablet)$"
      "float,qalculate"
      "float,Rofi"
      "float,ncmpcpp"
      "float,viewnior"
      "float,feh"
    ];

    windowrulev2 = [
      "idleinhibit fullscreen, title:(.*?)" # dont block if any app is on fullscreen

      ''
        opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$
      ''

      "noanim,class:^(xwaylandvideobridge)$"
      "nofocus,class:^(xwaylandvideobridge)$"
      "noinitialfocus,class:^(xwaylandvideobridge)$"
    ];

    layerrule = ["blur, swaync-control-center" "ignorealpha 0.4, swaync-control-center"];
  };
}
