{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, home-manager, rust-overlay, ... }:
    let system = "x86_64-darwin";
    in
    {
      homeConfigurations."vanilla" =
        home-manager.lib.homeManagerConfiguration {
          inherit system;

          username = "vanilla";
          homeDirectory = "/Users/vanilla";

          configuration = { pkgs, ... }: {
            imports = [ ./home.nix ];

            nixpkgs.overlays = [ rust-overlay.overlay ];
            home.packages = [
              pkgs.rust-bin.stable.latest.default
              pkgs.rust-bin.stable.latest.rust-src
            ];
          };
        };
    };
}
