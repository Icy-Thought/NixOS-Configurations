{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    home-manager = {
      type = "github";
      owner = "rycee";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix"
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    naersk = {
      type = "github";
      owner = "nmattia";
      repo = "naersk";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      type = "github";
      owner = "oxalica";
      repo = "rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

    # Disabled inputs until further notice:
    #
    # nixos-hardware = {
    #   type = "github";
    #   owner = "NixOS";
    #   repo = "nixos-hardware";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   flake = false;
    # };

    # emacs-overlay = {
    #   type = "github";
    #   owner = "nix-community";
    #   repo = "emacs-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

  };

  outputs = @inputs{ 
    self, 
    nixpkgs,
    home-manager,
    agenix,
    rust-overlay,
    neovim-overlay,
    # emacs-overlay,
    ... 

  }: 

  let
    inherit (nixpkgs) lib;
    inherit (lib) recrusiveUpdate;
    system = "x86_64-linux";
    stable-pkgs = import ./overlays;
    
    pkgs = (utils.pkgImport nixpkgs overlays);
    hmImports = [
      ./home/home.nix
    ];

    nixosModules = (hostname: [
      nixpkgs.nixosModules.notDetected
      home-manager.nixosModules.home-manager
      ({
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.sirius = {
          import = hmImports ++ [ (./. + "home/${hostname}.hm.nix") ];
        };
      })
    ]);

    overlays = [
      stable-pkgs
      # emacs-overlay.overlay
    ];

  in
  {
    homeConfigurations = {
      sirius = 
        home-manager.lib.homeManagerConfiguration {
          inherit system;
          homeDirectory = /home/sirius;
          username = "sirius";
          configuration = { pkgs, ... }: {
            imports = hmImports;
            nixpkgs.overlays = overlays;
          };
        };

        orca = 
        home-manager.lib.homeManagerConfiguration {
          inherit system;
          homeDirectory = /home/orca;
          username = "orca";
          configuration = { pkgs, ... }: {
            imports = hmImports;
            nixpkgs.overlays = overlays;
          };
        };
    };

    nixosConfigurations = 
      let
        dirs = lib.filterAttrs (name: fileType: (fileType == "regular") && (lib.hasSuffix ".nixos.nix" name)) (builtins.readDir ./hosts);
        fullyQualifiedDirs = (lib.mapAttrsToList (name: _v: ./. + "/hosts/${name}") dirs);

      in
      utils.buildNixosConfigurations fullyQualifiedDirs;

  }
