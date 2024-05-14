{
  description = "petingoso's flake";

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: {
    nixosConfigurations = import ./hosts {inherit nixpkgs inputs self;};
  };
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
    };
    miru.url = "github:karitham/knixpkgs";

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
  };
}
