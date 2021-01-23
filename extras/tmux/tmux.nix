{ config, pkgs, ... }:

let
  tmuxConf = builtins.readFile ./tmux.conf;

in
{
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = tmuxConf;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "a";
    terminal = "screen-256color";
  };

}
