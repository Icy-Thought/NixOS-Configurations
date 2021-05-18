self: super:

let
  source = builtins.fetchTarball {
    name = "emacs-overlay";
    url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
  };

in
{
  emacs.unstable = self.callPackage (import source) {};
}
