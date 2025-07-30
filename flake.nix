{
  description = "My development environments";

  outputs = inputs @ { self, ... }: {
    # Don't define anything here; each subflake has its own devShell
  };
}
