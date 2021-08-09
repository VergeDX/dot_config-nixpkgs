{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn
  ];

  # https://formulae.brew.sh/formula/openjdk@8
  home.sessionPath = [ "/Users/vanilla/Android/platform-tools" ];
  home.file.".config/flutter/settings".text = builtins.toJSON {
    "enable-macos-desktop" = true;
  };

  # https://stackoverflow.com/questions/60054531/how-can-i-solve-the-connection-problem-during-npm-install-behind-a-proxy
  home.sessionVariables = {
    ELECTRON_GET_USE_PROXY = true;
    GLOBAL_AGENT_HTTPS_PROXY = "http://127.0.0.1:7890";
  };
}
