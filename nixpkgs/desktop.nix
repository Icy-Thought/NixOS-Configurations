{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # pop-os-shell                                      # Gnome Tiling Manager.
    zathura                                             # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                           # Rust-based Terminal.
    brave                                               # Chromium-based browser.
    latest.firefox-nightly-bin                          # Latest Firefox edition.
    openrazer-daemon                                    # Control your razer hardware.
    # Polychromatic                                     # GUI to control OpenRazer.
  ];
}
