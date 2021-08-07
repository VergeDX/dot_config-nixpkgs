{ programs, pkgs, ... }:
{
  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.starship.settings = {
    add_newline = false;
    line_break = { disabled = true; };
  };

  # https://nixos.org/download.html
  programs.fish.shellInit = "replay . /Users/vanilla/.nix-profile/etc/profile.d/nix.sh";
  programs.fish.plugins = [
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
