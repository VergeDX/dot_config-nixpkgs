{ programs, pkgs, home, ... }:
{
  programs.git.enable = true;
  programs.git.userName = "Vanilla";
  programs.git.userEmail = "neko@hydev.org";

  home.packages = [ pkgs.gh ];

  programs.git.includes = [
    {
      path = (pkgs.fetchurl {
        url = "https://github.com/GitAlias/gitalias/raw/main/gitalias.txt";
        sha256 = "01h369l2am2bgwlgjasvllxfjwjx0f90l01z1dx4ns4r3slcds9d";
      }).outPath;
    }
  ];

  programs.git.extraConfig = {
    init.defaultBranch = "master";
    core.editor = "nvim";
  };

  programs.ssh.enable = true;
  programs.ssh.matchBlocks."git@github.com" = {
    host = "github.com";
    user = "git";
    proxyCommand = "nc -x 127.0.0.1:7890 %h %p";
  };

  programs.gpg.enable = true;
  programs.git.signing.key = "4DFA2BDD7305E739";
  programs.git.signing.signByDefault = true;

  programs.git.extraConfig = {
    pack = {
      windowMemory = "2g";
      packSizeLimit = "1g";
    };
  };
}
