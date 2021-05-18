{ ... }
{
  imports = [
    ../home/home.nix
  ];

  profiles = {
    git = {
      enable = true;
      userName = "Icy-Thought";
      userEmail = "gilganyx@gmail.com";
      extraConfig.github.user = "Icy-thought";
      # extraConfig.core.excludesfile = builtins.toString ./gitignore_global;
    };

  # gtk = {
  #     enable = true;
  #     theme = {
  #       package = pkgs.arc-theme;
  #       name = "Arc-Dark";
  #     };
  #     iconTheme = {
  #       package = pkgs.paper-icon-theme;
  #       name = "Paper";
  #     };
  #     # Give Termite some internal spacing.
  #     gtk3.extraCss = ".termite {padding: 20px;}";
  # };

  };
}
