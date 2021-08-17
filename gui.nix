{ home, pkgs, ... }:
let metro-for-steam = pkgs.callPackage ./metro-for-steam.nix { };
in
{
  home.packages = [ pkgs.gimp ];
  home.file."Library/Application Support/Steam/Steam.AppBundle/Steam/Contents/MacOS/skins/".source = metro-for-steam;
}
