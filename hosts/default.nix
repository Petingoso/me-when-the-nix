{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
in {
  nixLive = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs self;
      config' = {
        hostname = "nixLive";
        username = "nixos";
      };
    };
    modules = [
      (inputs.nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
      ./nixLive
      ./common.nix
      ../modules/fonts.nix
      ../modules/home-manager.nix
      ../modules/locale.nix
      ../modules/nix-settings.nix
      ../modules/sound.nix
    ];
  };
  nixVM = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs self;
      config' = {
        hostname = "nixVM";
        username = "petnix";
      };
    };
    modules = [
      ./nixVM
      ./common.nix
      ../modules/fonts.nix
      ../modules/home-manager.nix
      ../modules/locale.nix
      ../modules/network.nix
      ../modules/nix-settings.nix
      ../modules/sound.nix
    ];
  };

  nixWired = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs self;
      config' = {
        hostname = "nixWired";
        username = "petnix";
      };
    };
    modules = [
      ./nixWired
      ./common.nix
      ../modules/bluetooth.nix
      ../modules/fcitx.nix
      ../modules/fonts.nix
      ../modules/home-manager.nix
      ../modules/locale.nix
      ../modules/network.nix
      ../modules/nix-settings.nix
      ../modules/oomd.nix
      ../modules/opentabletdriver.nix
      ../modules/opensnitch.nix
      ../modules/polkit.nix
      ../modules/sound.nix
      ../modules/systemd-boot.nix
      inputs.nixos-hardware.nixosModules.lenovo-legion-15arh05h
    ];
  };
}
