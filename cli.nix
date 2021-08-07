{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.wget
    pkgs.tree
  ];
}
