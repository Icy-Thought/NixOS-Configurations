{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    wayland                                             # Wayland window system code + protocol.
    mesa                                                # FOSS 3D Graphics Lib.
    vulkan-headers                                      # Vulkan Header files + API registery.
    # pop-os-shell                                      # Gnome Tiling Manager.
    zathura                                             # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                           # Rust-based Terminal.
    brave                                               # Chromium-based browser.
    firefox-devedition-bin                              # Firefox + dev-tools enabled.
    latest.firefox-nightly-bin                          # Latest Firefox edition.
    openrazer-daemon                                    # Control your razer hardware.
    # Polychromatic                                     # GUI to control OpenRazer.
  ];
}
