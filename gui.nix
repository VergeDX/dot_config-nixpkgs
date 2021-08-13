{ home, pkgs, ... }:
let kitty_themes_baseurl = "https://github.com/dexpota/kitty-themes/raw/master/themes";
in
{
  home.packages = [ pkgs.gimp ];

  programs.kitty.enable = true;
  # programs.kitty.font.package = pkgs.nerdfonts;
  programs.kitty.font.name = "Hack Nerd Font Mono";

  home.file.".config/kitty/Solarized_Light.conf".source = pkgs.fetchurl {
    url = "${kitty_themes_baseurl}/Solarized_Light.conf";
    sha256 = "sha256-1UN/jP63IqA0L3848pAjoeeG/uyoVD91zBexXzD3tvU=";
  };
  home.file.".config/kitty/Solarized_Dark.conf".source = pkgs.fetchurl {
    url = "${kitty_themes_baseurl}/Solarized_Dark.conf";
    sha256 = "sha256-pGY6ZTrDNWflJXMOgNOhVlFMAVpinkGIXhlrBZpnkm8=";
  };

  # https://github.com/kovidgoyal/kitty/issues/1792
  # https://github.com/dexpota/kitty-themes/blob/master/README.md#previews
  programs.kitty.settings = {
    macos_quit_when_last_window_closed = "yes";

    # https://sw.kovidgoyal.net/kitty/conf/?highlight=listen_on#opt-kitty.listen_on
    # https://sw.kovidgoyal.net/kitty/invocation/#cmdoption-kitty-listen-on
    # https://sw.kovidgoyal.net/kitty/remote-control/?highlight=#cmdoption-kitty-to
    allow_remote_control = "yes";
    listen_on = "unix:/tmp/mykitty";

    # https://sw.kovidgoyal.net/kitty/conf/#window-layout
    remember_window_size = "no";
    initial_window_width = 640;
    initial_window_height = 400;
  };
}
