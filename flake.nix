{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    rust-overlay.url = "github:oxalica/rust-overlay";

    # https://github.com/NickCao/flakes/blob/master/flake.nix
    deploy-rs.url = "github:serokell/deploy-rs";
    deploy-rs.inputs.nixpkgs.follows = "nixpkgs";

    # https://github.com/VanCoding/nix-vscode-extension-manager
    nvem.url = "github:vancoding/nix-vscode-extension-manager";
  };

  outputs = { self, nixpkgs, home-manager, rust-overlay, deploy-rs, nvem, ... }:
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

            nixpkgs.overlays = [ rust-overlay.overlay deploy-rs.overlay ];
            home.packages = [
              pkgs.rust-bin.stable.latest.default
              pkgs.rust-bin.stable.latest.rust-src
            ] ++ [ pkgs.deploy-rs.deploy-rs ] ++ [
              # https://github.com/SCP-2000/infrastructure/blob/master/nixos/hel0/default.nix#L10
              nvem.packages.${system}.nvem
            ];
          };
        };
    };
}
