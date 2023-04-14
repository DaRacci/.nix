{
  description = "Home Manager configuration of racci";

  inputs = {
    nixpkgs.url = { url = "github:nixos/nixpkgs/nixos-unstable"; }
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };

    flake-utils = { url = "github:numtide/flake-utils"; }
    nix-rice = { url = "github:bertof/nix-rice"; };
  };

  outputs = { nixpkgs, home-manager, nix-rice, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      overlays = [ nix-rice.overlays.default ];
    in {
      flake-utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs { inherit overlays };
        in
        {
          homeConfigurations.racci = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            
            # Specify your home configuration modules here, for example,
            # the path to your home.nix.
            modules = [
                ./home.nix
                ./mixins.d/base/gui.nix
                ./mixins.d/base/fonts.nix
                ./mixins.d/base/terminal.nix
                ./mixins.d/base/input.nix
                ./mixins.d/base/theme.nix
            ];
        });
      };
    };
}
