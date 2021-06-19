{ config, pkgs, lib, ... }:

{
  imports = [ 
      ./hardware-configuration.nix
      ./users.nix
      ./services.nix
      ./packages.nix
      ../wireguard.nix
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
    kernelPackages = pkgs.linuxPackages_xanmod;

    extraModulePackages = with config.boot.kernelPackages; [ 
      # amdgpu-pro
    ];
    
    kernelParams = [
      "pcie_aspm.policy=performance"
      "acpi_backlight=native"
    ];

    kernel.sysctl = {
      "abi.vsyscall" = 0;
    };
    
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
        useOSProber = true;
      };
    };

    cleanTmpDir = true;

  };

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/a2ee4473-ef03-4cb9-8103-ba4c3d8afb1e";
      fsType = "ext4";
      options = [ "noatime, x-gvfs-hide" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3988-91C5";
      fsType = "vfat";
      options = [ "x-gvfs-hide" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/4b1d85cf-c670-4e7e-9b4a-02b3657338dd";
      fsType = "ext4";
    };

  networking = {
    hostName = "NixOS";

    # Global useDHCP => deprecated.
    useDHCP = false;

    # Per-interface useDHCP is mandatory. (Not Required by NetworkManager)
    # interfaces = {
    #   enp1s0.useDHCP = true;
    #   wlan0.useDHCP = true;
    # };

    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };

    nat = {
      enable = true;
      externalInterface = "eth0";
      internalInterfaces = [ "wg0" ];
    };

    iproute2 = {
      enable = true;
    };

    firewall = {
      allowedTCPPorts = [ 53 ];
      allowedUDPPorts = [ 53 51820 ];                                   # Wireguard
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];           # KDE-Connect
      allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];           # KDE-Connect
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
    enableRedistributableFirmware = true;

    cpu.amd = {
      updateMicrocode = true;
    };

    opengl = {
      enable = true;

      extraPackages = with pkgs; [
        # amdvlk
        # driversi686Linux.amdvlk
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

    openrazer = {
      enable = true;
      devicesOffOnScreensaver = false;
      syncEffectsEnabled = true;
      mouseBatteryNotifier = true;
    };

  };

  virtualisation = {
    podman = {
      enable = false;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
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

   fonts = {
     enableDefaultFonts = true;
   
     fontconfig = {
       defaultFonts = {
         serif = [ "Cantarell" "Noto Kufi Arabic" ];
         sansSerif = [ "Cantarell" "Noto Kufi Arabic" ];
         monospace = [ "Cantarell" "Noto Kufi Arabic" ];
       };
     };
   };

}
