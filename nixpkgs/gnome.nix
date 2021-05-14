{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # gnome3.gnome-tweak-tool                           # Advance Gnome setting control.
    dconf                                               # Configuration + Setting management.
  ];
}
