{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    wine-staging                                        # Latest Wine package.
    steam                                               # Gaming platform.
    lutris                                              # WINE gaming platform.
    osu-lazer                                           # FOSS Rythm game!
  ];
}
