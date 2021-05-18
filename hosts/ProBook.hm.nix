{ ... }:
{
  imports = [
    ../home/home.nix
  ];

  profiles = {
    emacs.enable = false;
    vim.enable = true;
  };

}
