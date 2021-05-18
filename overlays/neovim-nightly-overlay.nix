self: super:

let
  source = builtins.fetchTarball {
    name = "neovim-nightly";
    url = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";
  };

in
{
  neovim.nightly = self.callPackage (import source) {};
}
