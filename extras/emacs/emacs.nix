{ config, lib, pkgs, ... }:

# Doom-Emacs
let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
  };
in {
  home.packages = [ doom-emacs ];
  home.file.".emacs.d/init.el".text = ''
      (load "default.el")
  '';
}

# Emacs Configurations
{
  programs.emacs = {
    enable = true;
  };

  services.emacs = {
    enable = true;
    package = doom-emacs;
  };
}
