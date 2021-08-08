{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn
  ];
}
