{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    gimp                                                # The better Photoshop alternative.
    inkscape                                            # The better Illustrator alternative.
    libreoffice                                         # The better office alternative suit.
    obs-studio                                          # Streaming/Recording software.
    qalculate-gtk                                       # Scientific calculator.
    signal-desktop                                      # More secure WhatsApp alternative.
    fractal                                             # Rust-based matrix client.
    easytag                                             # M3U Editor.
    zoom-us                                            # Conferencing application..
  ];
}
