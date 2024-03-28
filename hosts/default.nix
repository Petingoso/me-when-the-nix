{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
in {
  nixWired = lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs self;
    };
    modules = [
      ./nixWired
      inputs.nixos-hardware.nixosModules.lenovo-legion-15arh05h
      "${self}/modules/common.nix"
      "${self}/options/default.nix"
    ];
  };
}
