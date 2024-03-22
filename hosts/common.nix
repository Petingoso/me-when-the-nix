# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config',
  pkgs,
  ...
}: {
  nix.settings.experimental-features = ["nix-command" "flakes"];
  users.users.${config'.username} = {
    isNormalUser = true;
    extraGroups = ["wheel" "video"];
  };
  networking.hostName = "${config'.hostname}";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    alejandra
    git
    neovim
    bat
    lynx
    nh
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
