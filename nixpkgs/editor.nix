{ pkgs, ... }:
{
  home.packages = with pkgs; [
    doom-emacs                                          # Emacs + Doom support.
    gnuplot                                             # Plotting through programming.
    neovim-nightly                                      # Neovim + Lua support.
    tmux                                                # Terminal multiplexer.
  ];
}
