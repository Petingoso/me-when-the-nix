{
  config,
  pkgs,
  self,
  ...
}: {
  home-manager.users.${config.mystuff.username} = {
    home.file.".local/bin/hyp" = {
      text = ''
         #!/bin/sh
        cd ~

        mkdir -p /tmp/themes/kitty/
        mkdir -p /tmp/themes/rofi/
        mkdir -p /tmp/themes/hyprland/
        mkdir -p /tmp/themes/nvim/

        cp -r ${self}/home/config/kitty/* /tmp/themes/kitty/
        cp -r ${self}/home/config/rofi/colors/* /tmp/themes/rofi/
        cp -r ${self}/home/config/hyprland/themes/* /tmp/themes/hyprland/

        echo 'vim.cmd("colorscheme gruvbox")' >> /tmp/themes/nvim/theme

        chmod 775 -R /tmp/themes/

        dbus-run-session Hyprland
      '';
      executable = true;
    };
  };
}
