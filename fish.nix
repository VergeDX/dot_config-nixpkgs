{ programs, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    line_break = { disabled = true; };
  };

  # https://github.com/LnL7/nix-darwin
  programs.fish.shellInit = "replay source /etc/static/bashrc";

  programs.fish.plugins = [
    {
      name = "done";
      src = pkgs.fetchgit {
        url = "https://github.com/franciscolourenco/done";
        rev = "1.16.3";
        sha256 = "sha256-Xld66z9vVp3kxikndZ9k/zlNvP0YSoSCNTBkJ8rT3uo=";
      };
    }
    {
      name = "pisces";
      src = pkgs.fetchgit {
        url = "https://github.com/laughedelic/pisces";
        rev = "v0.7.0";
        sha256 = "sha256-Oou2IeNNAqR00ZT3bss/DbhrJjGeMsn9dBBYhgdafBw=";
      };
    }
    {
      name = "replay.fish";
      src = pkgs.fetchgit {
        url = "https://github.com/jorgebucaran/replay.fish";
        rev = "1.2.0";
        sha256 = "sha256-Q/9YVdiRSJw1SdcfQv2h7Lj6EyFustRk+kmh1eRRQ6k=";
      };
    }
  ];
}
