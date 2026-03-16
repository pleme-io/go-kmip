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

  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "go";
    builder = "library";
    pname = "go-kmip";
    vendorHash = "sha256-KemjY8oC4UmBhp79TF5st6PsoLq32edL9SaSK/L/FsA=";
    description = "Go implementation of a subset of the KMIP 1.4 protocol";
    homepage = "https://github.com/pleme-io/go-kmip";
  };
}
