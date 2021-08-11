{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn

    pkgs.nodePackages.yo
    pkgs.nodePackages.generator-code

    pkgs.cmake
    pkgs.gnumake
    pkgs.clang
    pkgs.lldb
  ];

  home.file."Documents/node_modules".source = "${pkgs.nodePackages.generator-code}/lib/node_modules";

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

  home.file."Library/Application Support/code-oss-dev/User/settings.json".text = builtins.toJSON {
    "window.autoDetectColorScheme" = true;
  };
}
