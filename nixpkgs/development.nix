{ config, pkgs, libs, ... }:
{
  home.packages = with pkgs; [
    latest.rustChannels.nightly.rust                    # Rust compiler.
    unstable.rust-analyzer                              # Rust-Analyzer for better rust completion.
    languagetool                                        # Proofreading (grammar checker) for several languages.
    ccls                                                # C/C++ language server powered by clang.
    cmake                                               # Automated build automation, testing & packaging software.
    texlive.combined.scheme-medium                      # LaTeX support.
    nodePackages.npm                                    # JS package manager.
    nodePackages.javascript-typescript-langserver       # Javascript support.
    podman                                              # Docker alternative.
    hugo                                                # Fast + Modern static web-engine.
  ];
}
