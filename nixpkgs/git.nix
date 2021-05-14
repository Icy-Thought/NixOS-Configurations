{ pkgs, ... }:
{
  home.packages = with pkgs; [
    diff-so-fancy
    git-crpt
    hub
    tig
  ];
}
