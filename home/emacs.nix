{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
    package = with pkgs; [
      # emacsUnstable
      emacsWithPackages (epkgs: [ epkgs.vterm ])
    ];
  };

  services.emacs = {
    enable = true;
  };
}
