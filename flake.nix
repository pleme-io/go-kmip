{
  description = "Go implementation of a subset of the KMIP 1.4 protocol";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = {
      url = "github:pleme-io/substrate";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, substrate, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
      mkGoLibraryCheck = (import "${substrate}/lib/go-library-check.nix").mkGoLibraryCheck;
    in {
      checks.default = mkGoLibraryCheck pkgs {
        pname = "go-kmip";
        version = "0.0.0-dev";
        src = self;
        vendorHash = "sha256-KemjY8oC4UmBhp79TF5st6PsoLq32edL9SaSK/L/FsA=";
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ go gopls gotools ];
      };
    });
}
