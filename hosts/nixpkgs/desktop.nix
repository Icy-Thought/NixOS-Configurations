{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    wayland                                             # Wayland window system code + protocol.
    vulkan-headers                                      # Vulkan Header files + API registery.
    zathura                                             # Minimal PDF/EPUB/DJUV/.. reader.
    alacritty                                           # Rust-based Terminal.
    brave                                               # Chromium-based browser.
    firefox-devedition-bin                              # Firefox + dev-tools enabled.
    latest.firefox-nightly-bin                          # Latest Firefox edition.
  ];
}
