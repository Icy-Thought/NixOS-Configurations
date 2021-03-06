{ config, lib, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./config.fish;
    # plugins = [
    #   {
    #     name = "z";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "jethrokuan";
    #       repo = "z";
    #       rev = "ddeb28a7b6a1f0ec6dae40c636e5ca4908ad160a";
    #       sha256 = "0c5i7sdrsp0q3vbziqzdyqn4fmp235ax4mn4zslrswvn8g3fvdyh";
    #     };
    #   }
    # ];

    shellAliases = {

      # ls = exa
      ls = "exa -l";
      lsa = "exa -la";
      temacs = "emacsclient -t";
      emacs = "emacsclient -c";
      fshcfg = "nvim ~/.config/fish/config.fish";
      abrcfg = "nvim ~/.config/fish/abbreviations.fish";
      bat0 = "upower -i /org/freedesktop/UPower/devices/battery_BAT0";
      
      # Git
      g = "git";
      gc = "git clone";
      ga = "git add";
      gaa = "git add -A";
      gcm = "git commit -m";
      gps = "git push";
      gpl = "git pull";
      gs = "git status";
      
      # Folder
      fysik2 = "cd ~/Projects/git/GitHub/Notebook/School-related/Fysik/Fysik-2/Digitala-Anteckningar";
      matte3 = "cd ~/Projects/git/GitHub/Notebook/School-related/Matematik/Matematik-3C/Kapitlar";
      dtek   = "cd ~/Projects/git/GitHub/Notebook/School-related/IT/Digital-Kommunikationsteknik";
      
      # VPN
      wup = "wg-quick up SEintegrity_vpn";
      wud = "wg-quick down SEintegrity_vpn";
    };
  };

  home.packages = with pkgs; [

    # Prompt
    starship
  ];

}
