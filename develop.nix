{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn
  ];

  home.sessionPath = [ "/Users/vanilla/Android/platform-tools" ];
}
