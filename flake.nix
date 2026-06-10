{
  description = "My collection of flake templates";

  outputs =
    { self }:
    {
      templates = {
        blank = {
          path = ./blank;
          description = "A blank template to start from";
        };
        ocaml = {
          path = ./ocaml;
          description = "Ocaml development template";
        };

        sail = {
          path = ./sail;
          description = "Sail development template";
        };

        zig = {
          path = ./zig;
          description = "Zig development template";
        };
        rust = {
          path = ./rust;
          description = "Rust development template";
        };
        typst = {
          path = ./typst;
          description = "Typst writing template";
        };
        python = {
          path = ./python;
          description = "Python development template";
        };

      };
    };
}
