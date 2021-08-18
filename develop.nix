{ home, pkgs, ... }:
{
  home.packages = [
    pkgs.nodejs
    pkgs.yarn

    pkgs.nodePackages.yo
    pkgs.nodePackages.generator-code

    pkgs.cmake
    pkgs.gnumake
    pkgs.gcc
    pkgs.gdb

    pkgs.openocd
    pkgs.stm32cubemx

    # https://github.com/ppy/osu
    pkgs.dotnet-sdk_5
    pkgs.mono
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

    DOTNET_CLI_TELEMETRY_OPTOUT = 1; # or true.
    DOTNET_SKIP_FIRST_TIME_EXPERIENCE = true;
  };

  home.file."Library/Application Support/code-oss-dev/User/settings.json".text = builtins.toJSON {
    "window.autoDetectColorScheme" = true;
  };
}
