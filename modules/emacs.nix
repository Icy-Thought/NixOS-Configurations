{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackages (epkgs: [ epkgs.vterm ]);
  };
  
  services.emacs = {
    enable = true;
  };
}
