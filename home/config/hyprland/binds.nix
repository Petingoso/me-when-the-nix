{
  self,
  config,
  ...
}: {
  imports = ["${self}/home/variables.nix"];

  wayland.windowManager.hyprland.settings = {
    bindm = ["ALT,mouse:272,movewindow" "ALT,mouse:273,resizewindow"];
    bind =
      [
        "ALT CONTROL, Q ,exit,"
        "ALT SHIFT, R, exec, hyprctl reload"
        "ALT, Space, togglefloating"
        "ALT, Q, killactive"
        "ALT, C, pseudo,"
        "ALT, F, fullscreen,"

        "ALT, G, exec, ~/.local/bin/togglegaps"
        "ALT, Return, exec, /usr/bin/kitty -1"

        "ALT, B, exec, pkill -SIGUSR1 'waybar'"

        ",Print,exec,grim $HOME/Pictures/SS/$(date +'%Y%m%d%H%M%S_1.png') && notify-send 'Screenshot Saved'"

        "SUPER,Print,exec,grim - | wl-copy && notify-send 'Screenshot Copied to Clipboard'"

        "SUPERSHIFT,Print,exec,grim - | swappy -f -"

        "SUPERSHIFT,S,exec,slurp | grim -g - /tmp/photo && wl-copy < /tmp/photo && notify-send 'Screenshot Copied to Clipboard'"

        ''
          ALT SHIFT,S,exec,slurp | grim -g - /tmp/photo && swappy -f /tmp/photo
        ''

        "ALT, D, exec, ${config.rofi-menu}"
        "ALT, T, exec, .local/bin/theme_changer_WL"
        "ALT CONTROL, X, exec,~/.local/bin/powermenu"
        "ALT CONTROL, K, exec,~/.local/bin/hypr_bindings"

        "ALT CONTROL, E,exec, hyprshade on blue-light-filter"
        "ALT CONTROL, R,exec, hyprshade off"

        "ALT SHIFT, P, exec, ${config.lock_cmd}"

        "ALT SHIFT, T, exec, swaync-client -t"

        "ALT, V, togglesplit"
        "ALT SHIFT, V, togglegroup"
        "ALT, N ,changegroupactive,f"
        "ALT SHIFT,N,changegroupactive,b"
        "ALT, S,layoutmsg,swapwithmaster"

        ",XF86MonBrightnessUp,exec,sudo light -A 10.2"
        ",XF86MonBrightnessDown,exec,sudo light -T 0.63"

        "ALT,P,exec,playerctl play-pause"
        ",XF86AudioRaiseVolume,exec,amixer set Master 5%+"
        ",XF86AudioLowerVolume,exec,amixer set Master 5%-"
        ",XF86AudioMute,exec,amixer -D pulse set Master 1+ toggle"
        ",XF86Calculator,exec,qalculate-gtk"

        "ALT, tab, workspace, +1"
        "ALT SHIFT, tab, workspace,, -1"
        "ALT, period, focusmonitor,r"
        "ALT, comma, focusmonitor,l"
        "ALT SHIFT,period,movewindow,mon:r"
        "ALT SHIFT,comma,movewindow,mon:l"

        "ALT CONTROL,left,splitratio,-0.1"
        "ALT CONTROL,right,splitratio,+0.1"
        "ALT CONTROL,h,splitratio,-0.1"
        "ALT CONTROL,l,splitratio,+0.1"

        "ALT, left, movefocus, l"
        "ALT, right, movefocus, r"
        "ALT, up, movefocus, u"
        "ALT, down, movefocus, d"

        "ALT, h, movefocus, l"
        "ALT, l, movefocus, r"
        "ALT, k, movefocus, u"
        "ALT, d, movefocus, d"

        "ALT SHIFT, left, movewindow, l"
        "ALT SHIFT, right, movewindow, r"
        "ALT SHIFT, up, movewindow, u"
        "ALT SHIFT, down, movewindow, d"

        "ALT SHIFT, h, movewindow, l"
        "ALT SHIFT, l, movewindow, r"
        "ALT SHIFT, k, movewindow, u"
        "ALT SHIFT, d, movewindow, d"
      ]
      ++ (
        # workspaces
        # binds ALT + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (x: let
            ws = let c = (x + 1) / 10; in builtins.toString (x + 1 - (c * 10));
          in [
            "ALT, ${ws}, workspace, ${toString (x + 1)}"
            "ALT SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}"
          ])
          10)
      );
  };
}
