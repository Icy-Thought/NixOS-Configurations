self: super:

let
  source = builtins.fetchTarball {
    name = "rust-nightly";
    url = "https://github.com/oxalica/rust-overlay/archive/master.tar.gz";
  };

in
{
  rustChannels.nightly = self.callPackage (import source) {};
}
