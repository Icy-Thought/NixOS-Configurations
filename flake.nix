{
  description = "NixOS configuration";

  inputs = {
    nixpkgs = {
      type = "github";
      owner = "NixOS";
      repo = "nixpkgs";
      ref = "nixpkgs-unstable";
    };

    flake-utils = {
      type = "github";
      owner = "numtide";
      repo = "flake-utils";
    };

    home-manager = {
      type = "github";
      owner = "rycee";
      repo = "home-manager";
      ref = "master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      type = "github";
      owner = "ryantm";
      repo = "agenix"
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nur = {
    #   type = "github";
    #   owner = "nix-community";
    #   repo = "nur";
    #   ref = "master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # Additional Flakes:
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

    neovim-nightly = {
      type = "github";
      owner = "nix-community";
      repo = "neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, home-manager, nixpkgs, flake-utils , agenix ... }: {
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      rec {
        packages = flake-utils.lib.flattenTree {
          hello = pkgs.hello;
          gitAndTools = pkgs.gitAndTools;
        };
        defaultPackage = packages.hello;
        apps.hello = flake-utils.lib.mkApp { drv = packages.hello; };
        defaultApp = apps.hello;
      }
    );

    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        pkgs = import nixpkgs {
          inherit system;
          config = { allowUnfree = true };
        };

        modules = [
          ./configuration.nix

          # Home-Manager:
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sirius = import ./home.nix;
          }

          # Agenix:
          agenix.nixosModules.age

          # Hardware Quirks for your NixOS system (Unavailable for E595)
          # nixos-hardware.nixosModules.lenovo-thinkpad-e595
        ];

        nixpkgs.overlays = [
          inputs = {
            neovim-nightly.overlay
            # emacs-overlay.overlay
            # nur.overlay
          };
        ];

      };
    };
  };
}
