{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.wget
    pkgs.tree

    pkgs.nodejs
    pkgs.nodePackages.pxder

    pkgs.nano
    pkgs.nanorc
  ];

  # https://gist.github.com/JeffreyCA/321f9e704e5561d60f90d9f3a923a0ac
  home.file.".nanorc".text = "include ${pkgs.nanorc}/share/*.nanorc";
}
