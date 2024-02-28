{ config, pkgs, ... }: {
imports = [../variables.nix];
  programs.waybar = {
    enable = true;
    settings = [{
      position = "left";
      modules-left = [ "custom/icon" "hyprland/workspaces" ];
      modules-right = [
        "custom/notification"
        "tray"
        "battery"
        "custom/separator"
        "clock"
        "custom/power"
      ];

      "hyprland/workspaces" = {
        all-outputs = true;
        on-click = "activate";
        format = "{icon}";
        format-icons = {
          "1" = "ー";
          "2" = "二";
          "3" = "三";
          "4" = "四";
          "5" = "五";
          "6" = "六";
          "7" = "七";
          "8" = "八";
          "9" = "九";
          "10" = "〇";
          "default" = "一";
        };
      };

      "custom/power" = {
        format = "⏻";
        on-click = "~/.local/bin/powermenu";
      };

      "clock" = {
        format = "{:%H\n%M}";
        tooltip-format =
          "<big>{:%Y %B}</big><tt><small>{calendar}</small></tt>";
      };

      "custom/icon" = {
        format = "";
        on-click = "${config.rofi-menu}";
      };

      "custom/separator" = { format = "──────"; };

      "battery" = { format = "{capacity}%"; };

      "custom/notification" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = " ";
          none = " ";
          dnd-notification = " <span foreground='red'><sup></sup></span>";
          dnd-none = " ";
        };

        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -C";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };

      "tray" = { show-passive-items = true; };

    }];

    style = ./waybar/style.css;
  };
}
