{
  description = "Flake delegating to dev shells in subfolders";

  inputs.python.url = "github:andreasfrisch/nix-environments?dir=python";

  outputs = { self, python, ... }: {
    devShells = {
      x86_64-linux = {
        python = python.devShells.x86_64-linux.default;
      };
    };

    python = python.devShells.x86_64-linux.default;
  };
}
