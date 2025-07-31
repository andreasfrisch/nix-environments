{
  description = "Python devShell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs }: {
    devShells.default = let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
      };
    in pkgs.mkShell {
      name = "python-env";
      buildInputs = with pkgs; [ python311 python311Packages.pip ];
    };
  };
}
