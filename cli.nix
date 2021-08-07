{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.wget
    pkgs.tree

    pkgs.nodejs
    pkgs.nodePackages.pxder
  ];
}
