{ config, pkgs, ... }:

let
  gappsPkgs= with pkgs.gnome; [
    geary                                                         # Gnome 2nd E-Mail client.
    zenity                                                        # Display Dialogs.
    polari                                                        # Gnome IRC client.
    meld                                                          # Visual merge/diff tool.
    gnome-boxes                                                   # Remove/Virtual system management.
    gnome-dictionary                                              # To look up mispellings.
    gnome-disk-utility                                            # Manage your disks through gnome.
    gnome-tweak-tool                                              # Advance Gnome setting control.
    gnome-software                                                # Gnome software store.
    gnome-packagekit                                              # Allows installing software on Gnome.
  ];

  gextPkgs = with pkgs; [
    # gnomeExtensions.pop-os-shell                                # Gnome Tiling Manager.
  ];

in {
  imports = [
    ../../home/default.nix
    # ../../home/modules/gnome.nix
    # ../../home/modules/dconf.nix                       <--- rework <---
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;

      firefox-nightly = {
        enableGnomeExtensions = true;
      };
    };

    overlays = [
      # (import ../../overlays/emacs-overlay.nix)
    ];

  };

  home.packages = builtins.concatLists [
    gappsPkgs
    gextPkgs
  ];

}
