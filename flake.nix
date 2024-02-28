{
    description = "petingoso's flake";

    outputs = {
        self,
        nixpkgs,
        ...
    } @ inputs: let
    in {
        nixosConfigurations = import ./hosts {inherit nixpkgs inputs self;};
    };
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

        hyprland.url = "github:hyprwm/Hyprland";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-gaming = {
            url = "github:fufexan/nix-gaming";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nur.url = "github:nix-community/NUR";

        nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

        nh = {
            url = "github:viperML/nh";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
}
