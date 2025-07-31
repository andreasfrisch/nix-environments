{
  description = "Python devShell";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "python-shell";
          buildInputs = with pkgs; [
            python311
            python311Packages.pip
          ];

          # Optional: set up virtualenv if needed
          shellHook = ''
            echo "Welcome to the Python 3.11 shell!"
            if [ ! -d .venv ]; then
              echo "Creating virtualenv in .venv..."
              python3 -m venv .venv
            fi
            source .venv/bin/activate
          '';
        };
      });
}
