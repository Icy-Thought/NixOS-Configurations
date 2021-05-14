{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Icy_Thought";
    userEmail = "gilganyx@gmail.com";
    extraConfig.github.user = "Icy_thought";
    # extraConfig.core.excludesfile = builtins.toString ./gitignore_global;
  };
}
