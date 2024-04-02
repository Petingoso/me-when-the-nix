{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
in {
  Wired = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs self;
    };
    modules = [
      ./Wired
      inputs.nixos-hardware.nixosModules.lenovo-legion-15arh05h
      "${self}/modules/common.nix"
      "${self}/options/default.nix"
    ];
  };

  # Live = lib.nixosSystem {
  #   system = "x86_64-linux";
  #   specialArgs = {
  #     inherit inputs self;
  #   };
  #   modules = [
  #     ./Live
  #     (inputs.nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
  #     "${self}/modules/common.nix"
  #     "${self}/options/default.nix"
  #   ];
  # };
}
