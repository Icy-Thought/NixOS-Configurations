{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    mpv                                                 # Media Player.
    celluloid                                           # GTK frontend for MPV.
    gimp                                                # The better Photoshop alternative.
    inkscape                                            # The better Illustrator alternative.
    libreoffice                                         # The better office alternative suit.
    obs-studio                                          # Streaming/Recording software.
    qalculate-gtk                                       # Scientific calculator.
    discord-canary                                      # Latest Discord client.
    tdesktop                                            # Telegram Desktop.
    signal-desktop                                      # More secure WhatsApp alternative.
    fractal                                             # Rust-based matrix client.
    # gnome.geary                                         # Gnome 2nd E-Mail client.
    gnome.polari                                      # Gnome IRC client.
    easytag                                             # M3U Editor.
    transmission-gtk                                    # BitTorrent Client.
    freetube                                            # FOSS private YT app.
    foliate                                             # Minimal E-Book reader.
    zoom-us                                             # Conferencing application..
  ];
}
