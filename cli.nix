{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.wget
    pkgs.tree

    pkgs.nodePackages.pxder

    pkgs.nano
    pkgs.nanorc

    pkgs.screenfetch
    pkgs.neofetch
    pkgs.lolcat

    pkgs.scrcpy

    pkgs.texlive.combined.scheme-full
  ];

  # https://gist.github.com/JeffreyCA/321f9e704e5561d60f90d9f3a923a0ac
  home.file.".nanorc".text = "include ${pkgs.nanorc}/share/*.nanorc";

  programs.autojump.enable = true;
  programs.autojump.enableFishIntegration = true;

  programs.nix-index.enable = true;
  programs.nix-index.enableFishIntegration = true;
}
