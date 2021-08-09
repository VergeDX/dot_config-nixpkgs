{ programs, ... }:
{
  # https://arslan.io/2021/02/15/automatic-dark-mode-for-terminal-applications/
  # https://neovim.io/doc/user/autocmd.html
  programs.neovim.extraConfig = ''
    function! MatchColorScheme()
      if system("defaults read -g AppleInterfaceStyle") =~ '^Dark'
        colorscheme emilia_dark
      else
        colorscheme emilia_light
      endif
    endfunction

    call MatchColorScheme()
    autocmd Signal SIGUSR1 call MatchColorScheme()
  '';
}
