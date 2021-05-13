# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

  nixpkgs = {
    config.allowUnfree = true;
  };

  # Boot configurations.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    
    # Set GRUB2 to default boot.
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };

      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        device = "nodev";
      };
    };
  };

  # Network configurations.
  networking = {
    hostName = "NixOS";
    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    useDHCP = false;

    interfaces = {
      enp1s0.useDHCP = true;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/Stockholm";

  fonts.fonts = with pkgs; [
    source-code-pro
    emacs-all-the-icons-fonts
    iosevka-bin
    liberation_ttf
    font-awesome
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
  ];

  # Enable sound + bluetooth
  sound.enable = true;

  hardware = {
    pulseaudio.enable = true;
    bluetooth.enable = true;
  };

  # Enable X11 + CUPS + Flatpak.
  services = {
    printing = {
      enable = true;
    };

    xserver = {
      enable = true;
      videoDrivers = [ "amdgpu"];

      layout = "us";
      xkbOptions = "eurosign:e";

      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
          tapping = true;
          disableWhileTyping = true;
        };
      };
    
      # GNOME DE:
      displayManager.gdm.enable = true;
      desktopManager.gnome3.enable = true;

      # KDE-Plasma
      # displayManager.sddm.enable = true;
      # desktopManager.plasma5.enable = true;
    };
  };

  # fileSystems = { //fix
  #   "/".options = [ "noatime,x-gvfs-hide" ];
  #   "/boot/".options = [ "noatime,x-gvfs-hide" ];
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;

    users.root = {
       initialHashedPassword = "$6$DMQjZ0Nn8JAb$2MBYjRZvhACwUJrDXI6GciNglr.KM3Yaza4CMUaG8HCxOJ2EtRqZZKvTBzRhIPQWjKiYeU3cCpntQNkToiUeu0";
       shell = pkgs.fish;
       packages = with pkgs; [ (neovim.override { viAlias = true; vimAlias = true; withNodeJs = true;}) ];
    };

    users.sirius = {
      initialHashedPassword = "$6$DMQjZ0Nn8JAb$2MBYjRZvhACwUJrDXI6GciNglr.KM3Yaza4CMUaG8HCxOJ2EtRqZZKvTBzRhIPQWjKiYeU3cCpntQNkToiUeu0";
      extraGroups = [ "wheel" "users" "network" "audio" "video" "storage" "plugdev" "adbusers" ];
      shell = pkgs.fish;
      isNormalUser = true;
    };

    users.orca = {
      initialHashedPassword = "$6$Xny1A0ZwSSw/t1$3MUaZ0Cr4nV/N.n2VTWLIg1of8SAzAFm7EA.KRFYXeRRitIfKAAeFLT8AVGxP8NyhYOPkRngclRQjqc5Gmzqb0";
      extraGroups = [ "wheel" "users" "network" "audio" "video" "storage" "plugdev" "adbusers" ];
      shell = pkgs.fish;
      isNormalUser = true;
    };
  };

  # Nix daemon config
  nix = {
    # Automate `nix-store --optimise`
    autoOptimiseStore = true;

    # Automate garbage collection
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };

    # Avoid unwanted garbage collection when using nix-direnv
    extraOptions = ''
      keep-outputs     = true
      keep-derivations = true
      experimental-features = nix-command flakes 
   '';

    package = pkgs.nixFlakes;

    # Required by Cachix to be used as non-root user
    trustedUsers = [ "root" "sirius" ];
  };
}
