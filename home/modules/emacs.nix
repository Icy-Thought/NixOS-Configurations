{ config, pkgs, ... }:
{
  programs.emacs = {
    enable = true;
  };

  services.emacs = {
    enable = true;
    package = with pkgs; [
      # emacsUnstable
      emacsWithPackages (epkgs: [ epkgs.vterm ])
    ];

  };
}
