{
  self,
  config,
  pkgs,
  ...
}: {
  home.file.".local/bin/powermenu" = {
    text = ''
          #!/bin/sh

      prompt="rofi -dmenu -theme ~/.config/rofi/launchers/power.rasi"

      uptime=$(uptime -p | sed -e 's/up //g')

      shutdown=" Shutdown"
      reboot=" Restart"
      lock=" Lock"
      logout="﫼 Logout"
      suspend="🖪 Suspend"
      cancel="窱 Cancel"

      option="$cancel\n$shutdown\n$reboot\n$lock\n$suspend\n$logout"

      select="$(echo "$option" | $prompt -p "Uptime - $uptime")"

      case $select in
      	$shutdown)
      		poweroff
      		;;
      	$reboot)
      		reboot
      		;;
      	$lock)
      		loginctl lock-session
      		;;
      	$suspend)
      		systemctl suspend
      		;;
      	$logout)
      		loginctl terminate-session self
      esac
    '';
    executable = true;
  };
}
