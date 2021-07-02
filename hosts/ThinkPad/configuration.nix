{ config, lib, pkgs, ... }:

let
  defaultPkgs = with pkgs; [
    chrome-gnome-shell                      # Gnome Shell integration for Chrome.
  ];

  utilPkgs = with pkgs; [
    binutils                                # Tools for manipulating binaries.
    moreutils                               # An extension to GNU utils.
    killall                                 # Completely eradicate processes.
    direnv                                  # Shell extension to manage env.
    pciutils                                # lspci, setpci & update-pciids support.
    psmisc                                  # Useful utilities which uses proc fs.
    wireguard                               # Wireguard tools.
    gnupg                                   # Encrypt/Decrypt software.
    firejail                                # Namespace-based sandboxing tool.
    exiftool                                # Control file metadata.
    xclip                                   # Copy/Paste in XOrg terminal.
    wl-clipboard                            # Wayland c-p/c-v.
    gh                                      # Official GitHub client.
    pv                                      # Progress-bar for mv/cp.
    fd                                      # faster find.
    exa                                     # better ls.
    ripgrep                                 # faster grep.
    skim                                    # faster fzf.
    tree 				    # Tree view.
    bustle                                  # Sequence diagrams for D-Bus traffic.
    dfeet                                   # D-Bus debugger.
    diffoscope                              # In-depth comparison tool.
    common-updater-scripts                  # Common nix updating scripts????
    zstd                                    # Undo-fu-session/undo-tree-compression.
    unrar                                   # Extracting files from rar files.
  ];                                        
                                            
  envPkgs = with pkgs; [                    
    wayland                                 # Wayland window system code + protocol.
    mesa                                    # FOSS 3D Graphics Lib.
    mesa-demos                              # Collection of demos/tests OpenGL & Mesa.
    vulkan-headers                          # Vulkan Header files + API registery.
    fish                                    # Shell with better defaults.
    iwd                                     # WPA_Supplicant alternative.
    pipewire                                # Multimedia pipeline API.
    git                                     # Tool for git usage.
    podman                                  # Docker alternative.
    appimage-run 			    # Enable AppImages support in NixOS.
    xdg-desktop-portal-gtk                  # DIP for sandboxed apps.
  ];

in {
  imports = [ 
      ./hardware-configuration.nix
      ../wireguard.nix
      # ./containers.nix
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
      # perf
      cpupower
    ];
    
    kernelParams = [
      "pcie_aspm.policy=performance"
      "acpi_backlight=native"
    ];

    kernel.sysctl = {
      "abi.vsyscall" = 1;
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

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a2ee4473-ef03-4cb9-8103-ba4c3d8afb1e";
    fsType = "ext4";
    options = [ "noatime, x-gvfs-hide" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/4b1d85cf-c670-4e7e-9b4a-02b3657338dd";
    fsType = "ext4";
    options = [ "noatime" ];
  };

  fileSystems."/boot" = { 
    device = "/dev/disk/by-uuid/3988-91C5";
    fsType = "vfat";
    options = [ "x-gvfs-hide" ];
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

  users = {
    defaultUserShell = pkgs.fish;
    mutableUsers = false;

    users.root = {
       initialHashedPassword = "$6$DMQjZ0Nn8JAb$2MBYjRZvhACwUJrDXI6GciNglr.KM3Yaza4CMUaG8HCxOJ2EtRqZZKvTBzRhIPQWjKiYeU3cCpntQNkToiUeu0";
       shell = pkgs.bash;
    };

    users.sirius = {
      isNormalUser = true;
      home = "/home/sirius";
      shell = pkgs.fish;
      extraGroups = [ "wheel" "users" "network" "audio" "video" "storage" "plugdev" "adbusers" ];
      initialHashedPassword = "$6$DMQjZ0Nn8JAb$2MBYjRZvhACwUJrDXI6GciNglr.KM3Yaza4CMUaG8HCxOJ2EtRqZZKvTBzRhIPQWjKiYeU3cCpntQNkToiUeu0";
    };

    users.orca = {
      isNormalUser = true;
      home = "/home/orca";
      shell = pkgs.fish;
      extraGroups = [ "wheel" "users" "network" "audio" "video" "storage" "plugdev" "adbusers" ];
      initialHashedPassword = "$6$Xny1A0ZwSSw/t1$3MUaZ0Cr4nV/N.n2VTWLIg1of8SAzAFm7EA.KRFYXeRRitIfKAAeFLT8AVGxP8NyhYOPkRngclRQjqc5Gmzqb0";
    };
  };

  # Recommended for pipewire
  security = {
    rtkit = {
      enable = true;
    };
  };

  hardware = {
    cpu.amd.updateMicrocode = 
      lib.mkDefault config.hardware.enableRedistributableFirmware;

    opengl = {
      enable = true;

      extraPackages = with pkgs; [
        mesa
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
      
      extraPackages32 = with pkgs.pkgsi686Linux; [ 
        mesa 
        amdvlk
      ];

      driSupport = lib.mkDefault true;
      driSupport32Bit = lib.mkDefault true;
    };

    pulseaudio = {
      enable = false;
    };

    bluetooth = {
      enable = true;
    };

    openrazer = {
      enable = true;
      devicesOffOnScreensaver = true;
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

  environment = {
    systemPackages = builtins.concatLists [
      defaultPkgs
      utilPkgs
      envPkgs
    ];

    variables = {
      VK_ICD_FILENAMES = [ "/run/opengl-driver/share/vulkan/icd.d/amd_icd64.json" ];
    };
  };

  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
        (nerdfonts.override { fonts = [ 
          "Iosevka"
          "JetBrainsMono"
          ]; 
        })
    
        source-code-pro
        emacs-all-the-icons-fonts
        liberation_ttf
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
      ];
    
    fontconfig = {
      defaultFonts = {
        serif = [ "Cantarell" "Noto Kufi Arabic" ];
        sansSerif = [ "Cantarell" "Noto Kufi Arabic" ];
        monospace = [ "Cantarell" "Noto Kufi Arabic" ];
      };
    };
  };

  systemd.services = {
    systemd-resolved.enable = true;
    systemd-machined.enable = false;
    upower.enable = true;
  };

  services = {
    gvfs.enable = true;
    avahi.enable = false;
    flatpak.enable = true;

    hdapsd.enable = lib.mkDefault true;
    fail2ban.enable = false;
    usbguard.enable = false;

    gnome = {
      gnome-keyring.enable = true;
      chrome-gnome-shell.enable = true;
    };

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
    
      displayManager.gdm = {
        enable  = true;
        wayland = true;
      };

      desktopManager.gnome = {
        enable = true;
        # debug = true;
      };
    };

    dbus = {
      enable = true;
      packages = with pkgs; [ 
        gnome.dconf 
      ];
    };

    udev = {
      extraRules = ''
        ACTION=="add|change", KERNEL=="nvme[0-9]*", ATTR{queue/scheduler}="none"
        ACTION=="add|change", KERNEL=="sd[a-z]|mmcblk[0-9]*", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="mq-deadline"
        ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="1", ATTR{queue/scheduler}="bfq"
      '';

      packages = with pkgs; [
        gnome.gnome-settings-daemon 
      ];

    };

    mpd = {
      enable = false;
      extraConfig = builtins.readFile ../../nixpkgs/config/mpd.conf;
    };

    pipewire = {
      enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };

      pulse.enable = true;
      # jack.enable = true;

      # Bluetooth pipewire settings:
      media-session.config.bluez-monitor.rules = [
        {
          matches = [ { "device.name" = "~bluez_card.*"; } ];
          actions = {
            "update-props" = {
              "bluez5.reconnect-profiles" = [ "hfp_hf" "hsp_hs" "a2dp_sink" ];
              "bluez5.msbc-support" = true;
            };
          };
        }

        {
          matches = [
            { "node.name" = "~bluez_input.*"; }
            { "node.name" = "~bluez_output.*"; }
          ];
          actions = {
            "node.pause-on-idle" = false;
          };
        }
      ];
    };
  };

}
