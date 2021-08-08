{ config, pkgs, ... }:

let neovim_config = (builtins.fetchurl {
  url = "https://github.com/VergeDX/config-nixpkgs/raw/master/config/neovim.nix";
  sha256 = "1s221kz43cgd35x3qhl5gay4cis746s20q7ncjdnlq71vbbz478l";
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
  imports = [
    ./git.nix
    ./fish.nix
    ./cli.nix
    ./gui.nix
    neovim_config
  ];

  home.sessionVariables = {
    https_proxy = "http://127.0.0.1:7890";
    http_proxy = "http://127.0.0.1:7890";
    all_proxy = "socks5://127.0.0.1:7890";

    NIXPKGS_ALLOW_UNFREE = 1;
    EDITOR = "nvim";
  };
}
