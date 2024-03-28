# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{...}: {
  imports = [
    ../../modules/system/systemd-boot.nix
    ../../modules/common.nix
    ../../options/default.nix
  ];
  mystuff.hostname = "nixWired";
  mystuff.username = "petnix";
  system.stateVersion = "24.05";
}
