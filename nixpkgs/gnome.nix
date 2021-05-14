{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome.gnome-tweak-tool                              # Advance Gnome setting control.
    # gnomeExtensions.appindicator                      # Enables systray icons.
    # gnomeExtensions.gsconnect                         # KDE Connect for Gnome.
  ];
}
