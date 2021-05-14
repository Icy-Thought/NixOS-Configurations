{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch                                           # Fetch system information.
    htop                                               # Monitor current processes.
    # mpd                                                # Media player daemon.
    # ncmpcpp                                            # TUI music player.
    # spotify-tui                                        # TUI for premium Spotify users.
    # speedtest-cli                                      # TUI Speedtest.
    youtube-dl                                         # YouTube media downloader.
    nnn                                                # TUI file manager.
  ];
}
