{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn
  ];

  # https://formulae.brew.sh/formula/openjdk@8
  home.sessionPath = [ "/Users/vanilla/Android/platform-tools" ];
  home.file.".config/flutter/settings".text = builtins.toJSON {
    "enable-macos-desktop" = true;
  };
}
