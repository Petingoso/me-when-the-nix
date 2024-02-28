{
  inputs,
  self,
  ...
}: let
  inherit (inputs.nixpkgs) lib;
in {
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
      ../modules
      inputs.home-manager.nixosModules.home-manager
      ../home/home.nix
    ];
  };
}
