{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    extraConfig = builtins.readFile ../home/config/mpd.conf;
  };

}
