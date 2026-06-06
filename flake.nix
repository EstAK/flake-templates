{
  description = "My collection of flake templates";

  outputs =
    { self }:
    {
      templates = {
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

        blank = {
          path = ./blank;
          description = "A blank template to start from";
        };

        rust = {
          path = ./rust;
          description = "Rust development template";
        };

      };
    };
}
