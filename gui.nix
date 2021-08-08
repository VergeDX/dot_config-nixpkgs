{ home, pkgs, ... }:
{
  home.packages = [ pkgs.gimp ];

  programs.kitty.enable = true;
  programs.kitty.font = { package = pkgs.hack-font; name = "Hack"; };
  programs.kitty.extraConfig = "include ./theme.conf";
  home.file.".config/kitty/theme.conf".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/dexpota/kitty-themes/master/themes/Solarized_Light.conf";
    sha256 = "sha256-1UN/jP63IqA0L3848pAjoeeG/uyoVD91zBexXzD3tvU=";
  };
}
