{
  description = "Python devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }: {
    devShells = {
      x86_64-linux = let
        pkgs = import nixpkgs { system = "x86_64-linux"; };
      in {
        default = pkgs.mkShell {
          name = "python-shell";
          buildInputs = with pkgs; [ python311 python311Packages.pip ];
        };
      };
    };
  };
}
