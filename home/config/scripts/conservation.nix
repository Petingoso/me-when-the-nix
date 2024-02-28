{ self, config, pkgs, ... }:

{
  home.file.".local/bin/conservation-mode" = {
    text = ''
      #!/usr/bin/env sh
      if [ $1 = 1 ]; then
      	echo "Enabling battery limit"
      	echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
      else
      	echo "Disabling battery limit"
      	echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
      fi

    '';
    executable = true;
  };
}
