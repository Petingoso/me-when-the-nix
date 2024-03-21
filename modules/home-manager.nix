{
  self,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    "${self}/home/home.nix"
  ];
}
