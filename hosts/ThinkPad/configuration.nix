{ config, pkgs, lib, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./services.nix
      ./users.nix
    ];

  # Build NixOS from latest stable release.
  system.stateVersion = "21.05"; # Did you read the comment?

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    package = pkgs.nixFlakes;

    # Automate `nix-store --optimise`
    autoOptimiseStore = true;

    extraOptions = lib.optionalString (config.nix.package == pkgs.nixFlakes)
    ''
      experimental-features = nix-command flakes

      # Avoid unwanted garbage collection when using nix-direnv
      keep-outputs     = true
      keep-derivations = true
    '';

    # Automate garbage collection
    gc = {
      automatic = true;
      dates     = "weekly";
      options   = "--delete-older-than 7d";
    };

    # Required by Cachix to be used as non-root user
    trustedUsers = [ "root" "sirius" ];
  };

  # Boot configurations.
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    # kernelPackages = pkgs.linuxPackages_xanmod.amdgpu-pro;
    kernelParams = [
      "pcie_aspm.policy=performance"
    ];
    
    # Set GRUB2 to default boot.
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        version = 2;
        efiSupport = true;
        device = "nodev";
      };
    };

    cleanTmpDir = true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/ef5dca4d-8612-4313-9d56-9ec9d600db77";
    fsType = "ext4";
    options = [ "noatime, x-gvfs-hide" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/96EA-7815";
    fsType = "vfat";
    options = [ "x-gvfs-hide" ];
  };

  networking = {
    hostName = "NixOS";

    # Global useDHCP => deprecated.
    useDHCP = false;

    # Per-interface useDHCP is mandatory. (Not Required by NetworkManager)
    interfaces = {
      enp1s0.useDHCP = true;
      wlp3s0.useDHCP = true;
    };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "ibus";
      ibus.engines = with pkgs.ibus-engines; [ libpinyin hangul mozc ];
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  time.timeZone = "Europe/Stockholm";

  # Recommended for pipewire
  security = {
    rtkit = {
      enable = true;
    };
  };

  hardware = {
    opengl = {
      enable = true;

      extraPackages = with pkgs; [
        amdvlk
        driversi686Linux.amdvlk
        rocm-opencl-icd
      ];

      driSupport = true;
      driSupport32Bit = true;
    };

    pulseaudio = {
      enable = false;
    };

    bluetooth = {
      enable = true;
    };
  };

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
    };
  };

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

  environment = {
    systemPackages = with pkgs; [
      wayland                                             # Wayland window system code + protocol.
      mesa                                                # FOSS 3D Graphics Lib.
      mesa-demos                                          # Collection of demos/tests for OpenGL & Mesa.
      vulkan-headers                                      # Vulkan Header files + API registery.
      bash                                                # The legendary shell.
      fish                                                # Shell with better defaults.
      iwd                                                 # WPA_Supplicant alternative.
      pipewire                                            # Multimedia pipeline API.
      git                                                 # Tool for git usage.
      podman                                              # Docker alternative.
    ];

    variables = {
      VK_ICD_FILENAMES = [ "/run/opengl-driver/share/vulkan/icd.d/amd_icd64.json" ];
    };
  };

  documentation = {
    man.enable   = true;
    info.enable  = true;
  };

  programs = {
    fish.enable  = true;
    adb.enable   = true;
    dconf.enable = true;
    gnupg.agent.enable = true;
  };

}
