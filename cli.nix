{ home, pkgs, ... }:
let mrConfig = path: url: repo:
  ''
    [${path}]
    checkout = git clone '${url}' '${repo}'
  '';
in
{
  home.packages = [
    pkgs.wget
    pkgs.tree
    pkgs.watch
    pkgs.p7zip
    pkgs.dmg2img
    pkgs.tmux

    pkgs.nodePackages.pxder
    pkgs.nodePackages.clipboard-cli
    pkgs.yarn2nix
    pkgs.nodePackages.node2nix

    pkgs.nano
    pkgs.nanorc

    pkgs.screenfetch
    pkgs.neofetch
    pkgs.lolcat

    pkgs.scrcpy
    pkgs.mr
    pkgs.binwalk

    pkgs.texlive.combined.scheme-full
  ];

  # https://gist.github.com/JeffreyCA/321f9e704e5561d60f90d9f3a923a0ac
  home.file.".nanorc".text = "include ${pkgs.nanorc}/share/*.nanorc";
  home.file.".mrconfig".text = builtins.concatStringsSep "\n" [
    (mrConfig "Documents/dot_config-nixpkgs"
      "git@github.com:VergeDX/dot_config-nixpkgs.git" "dot_config-nixpkgs")
    (mrConfig "Documents/dot_nixpkgs"
      "git@github.com:VergeDX/dot_nixpkgs.git" "dot_nixpkgs")
    (mrConfig "Documents/dark-mode-notify"
      "git@github.com:bouk/dark-mode-notify.git" "dark-mode-notify")
    (mrConfig "Documents/nixpkgs"
      "git@github.com:NixOS/nixpkgs.git" "nixpkgs")
    (mrConfig "Documents/menubar_runcat"
      "git@github.com:VergeDX/menubar_runcat.git" "menubar_runcat")
    (mrConfig "Documents/ProperTree"
      "git@github.com:corpnewt/ProperTree.git" "ProperTree")
    (mrConfig "Documents/osu"
      "git@github.com:ppy/osu.git" "osu")
  ];

  programs.autojump.enable = true;
  programs.autojump.enableFishIntegration = true;
}
