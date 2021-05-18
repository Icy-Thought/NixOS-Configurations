self: super:

let
  source = builtins.fetchTarball {
    name = "neovim-nightly-overlay";
    url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  };

in
{
  neovim-nightly-overlay = self.callPackage (import source) {};
}
