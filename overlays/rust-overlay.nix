{ ... }
self: super:

let
  source = builtins.fetchTarball {
    name = "rust-overlay";
    url = "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  };

in
{
  rust-overlay = self.callPackage (import source) {};
}
