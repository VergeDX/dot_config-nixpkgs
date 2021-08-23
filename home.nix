{ config, pkgs, ... }:
let
  vergedx_config_baseurl = "https://github.com/VergeDX/config-nixpkgs/raw/master/config";
  neovim_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/neovim.nix";
    sha256 = "022pyndxnq6ydfdrd0mfmblxywkvqb77m1p538v6y55500w8959n";
  });
  shells_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/shells.nix";
    sha256 = "17g02qnh6r4s1ihfsksz78b3ya4x1z3chnydz455y95abbgh8ck2";
  });
  vscode_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/vscode.nix";
    sha256 = "0k97f4xrrp070wdqwskcb0xp8nw9k2x9mqcacadvpl8ihpg6x5g8";
  });
in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vanilla";
  home.homeDirectory = "/Users/vanilla";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.09";

  home.packages = [ pkgs.nixpkgs-fmt ];
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./git.nix
    ./cli.nix
    ./gui.nix
    ./develop.nix

    neovim_config
    ./extra/neovim.nix
    shells_config
    ./extra/fish.nix
    vscode_config
    ./dark-mode-notify.nix
  ];

  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "socks5://127.0.0.1:7890";
  };
}
