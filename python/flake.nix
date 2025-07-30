     inherit system;
        };

        python = pkgs.python311; # or pkgs.python312 if you want 3.12
      in {
        devShells.python = pkgs.mkShell {
          name = "python-dev";

          buildInputs = [
            python
            python.pkgs.pip
            python.pkgs.setuptools
            python.pkgs.wheel
          ];

          shellHook = ''
            echo "🐍 Python dev shell active (Python ${python.version})"
            echo "Use 'pip install --user ...' to install local packages"
          '';
        };
      });
}
