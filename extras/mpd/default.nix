{ config, pkgs, ... }:

{
  services.mpd = {
    enable = true;
    extraConfig = builtins.readFile ./mpd.conf;
  };

}
