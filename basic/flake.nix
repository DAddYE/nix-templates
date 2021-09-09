{
  description = "TODO";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        inherit (lib) attrValues;
        pkgs = nixpkgs.legacyPackages.${system};
        lib = nixpkgs.lib;
        package = with pkgs; callPackage ./. { inherit pkgs; };
      in rec {
        app = pkgs.stdenv.mkDerivation {
          name = "TODO";
          src = pkgs.lib.cleanSource ./.;
          preferLocalBuild = true;
          buildInputs = with pkgs; [ ];
        };

        devShell = pkgs.mkShell { buildInputs = with pkgs; [ app ]; };
        defaultPackage = package;
      });
}
