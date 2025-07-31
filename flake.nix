{
  description = "Reusable devShells";

  outputs = { self }: {
    templates.python = {
      path = ./python;
      description = "Python devShell with direnv support";
    };
  };
}
