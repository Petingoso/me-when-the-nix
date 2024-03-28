# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{...}: {
  imports = [
    ../../modules/system/systemd-boot.nix
  ];
  system.stateVersion = "24.05";

  mystuff.hostname = "nixWired";
  mystuff.username = "petnix";
  mystuff = {
    # networkmanager.enable = true;
    # nixsettings.enable = true;
    home-manager.enable = true;
    # kitty.enable = true;
    # nvim-config.enable = true;
    # ranger.enable = true;
    # gtk.enable = true;
    # qt.enable = true;
    firefox-config.enable = true;
  };
}
