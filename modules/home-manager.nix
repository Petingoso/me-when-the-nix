{
  self,
  inputs,
  ...
}: {
  modules = [
    inputs.home-manager.nixosModules.home-manager
    "${self}/home/home.nix"
  ];
}
