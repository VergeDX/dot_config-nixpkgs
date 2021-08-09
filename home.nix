{ config, pkgs, ... }:

let
  vergedx_config_baseurl = "https://github.com/VergeDX/config-nixpkgs/raw/master/config";
  neovim_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/neovim.nix";
    sha256 = "1m0r35hwa1anignb0v1cvc7p3hzwh55ybdxgmizda6ya7yn4zzbs";
  });
  shells_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/shells.nix";
    sha256 = "sha256:01b5s97hhq4rbsbrlvq1x2akcsll9lsvr2sb3ypay704ay6ky1d2";
  });
  vscode_config = (builtins.fetchurl {
    url = "${vergedx_config_baseurl}/vscode.nix";
    sha256 = "03imb5n4yb0k3y0shawl4132rwry3rpdnhjjr6v8n0rwqmwi47dw";
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
    ./fish.nix
    ./cli.nix
    ./gui.nix
    ./develop.nix

    neovim_config
    ./neovim.nix
    shells_config
    vscode_config
    ./dark-mode-notify.nix
  ];

  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "socks5://127.0.0.1:7890";
  };
}
