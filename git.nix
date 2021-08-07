{ programs, pkgs, ... }:
{
  programs.git.enable = true;
  programs.git.userName = "Vanilla";
  programs.git.userEmail = "neko@hydev.org";

  home.packages = [ pkgs.netcat ];
  programs.ssh.enable = true;
  programs.ssh.matchBlocks."git@github.com" = {
    host = "github.com";
    user = "git";
    proxyCommand = "nc -X connect -x localhost:7890 %h %p";
  };

  programs.gpg.enable = true;
  programs.git.signing.key = "4DFA2BDD7305E739";
  programs.git.signing.signByDefault = true;
}
