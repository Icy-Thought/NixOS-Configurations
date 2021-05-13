{ pkgs, ... }:

let
  doom-emacs = pkgs.callPackage (builtins.fetchTarball {
    url = https://github.com/vlaci/nix-doom-emacs/archive/master.tar.gz;
  }) {
    doomPrivateDir = ./doom.d;  # Directory containing your config.el init.el
                                # and packages.el files
  };

in {
  home.file.".emacs.d/init.el".text = ''
      (load "default.el")
  '';

  programs.emacs = {
    enable = true;
    package = pkgs.emacsWithPackages (epkgs: [ epkgs.vterm ]);
  };
  
  services.emacs = {
    enable = true;
  };
}
