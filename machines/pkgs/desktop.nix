{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    wayland
    zathura                                             # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                           # Rust-based Terminal.
    brave                                               # Chromium-based browser.
    firefox-devedition-bin                              # Firefox + dev-tools enabled.
    latest.firefox-nightly-bin                          # Latest Firefox edition.
    gimp                                                # The better Photoshop alternative.
    inkscape                                            # The better Illustrator alternative.
    libreoffice                                         # The better office alternative suit.
    obs-studio                                          # Streaming/Recording software.
    qalculate-gtk                                       # Scientific calculator.
    signal-desktop                                      # More secure WhatsApp alternative.
    fractal                                             # Rust-based matrix client.
    easytag                                             # M3U Editor.
  ];
}
