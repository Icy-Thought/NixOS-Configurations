{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    steam                                               # Gaming platform.
    lutris                                              # WINE gaming platform.
    osu-lazer                                           # FOSS Rythm game!
  ];
}
