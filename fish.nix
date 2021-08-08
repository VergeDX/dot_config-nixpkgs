{ programs, pkgs, ... }:
let
  thefuck_nocheck = pkgs.thefuck.overrideAttrs (
    oldAttrs: rec { pytestCheckPhase = "echo"; }
  );
in
{
  programs.fish.enable = true;
  home.packages = [ thefuck_nocheck ];
  # https://github.com/LnL7/nix-darwin
  programs.fish.shellInit = ''
    replay source /etc/static/bashrc
    thefuck --alias | source

    # https://docs.brew.sh/Shell-Completion
    # set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    # set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
  '';
}
