{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    extraConfig = builtins.readFile ../config/mpd.conf;
  };

}
